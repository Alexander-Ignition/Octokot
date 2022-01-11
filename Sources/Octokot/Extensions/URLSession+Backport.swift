import Foundation

extension URLSession {
    var backport: GHBackport { GHBackport(session: self) }

    struct GHBackport {
        let session: URLSession

        func data(for request: URLRequest) async throws -> (Data, URLResponse) {
            if #available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *) {
                return try await session.data(for: request, delegate: nil)
            } else {
                return try await withCheckedThrowingContinuation { continuation in
                    let task = session.dataTask(with: request) { data, response, error in
                        switch (response, error) {
                        case (_, let error?):
                            continuation.resume(throwing: error)
                        case (.none, _):
                            let message = "Missing URLResponse"
                            let error = URLError(.unknown, userInfo: [NSLocalizedDescriptionKey: message])
                            continuation.resume(throwing: error)
                        case (let response?, _):
                            let body = data ?? Data()
                            continuation.resume(returning: (body, response))
                        }
                    }
                    task.resume()
                }
            }
        }
    }
}
