import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public final class GHSession: GHClient {
    public let session: URLSession
    public let configuration: GHConfiguration

    public init(session: URLSession, configuration: GHConfiguration) {
        self.session = session
        self.configuration = configuration
    }

    public convenience init(configuration: GHConfiguration) {
        let session = URLSession(configuration: .default)
        session.sessionDescription = "GitHub"
        self.init(session: session, configuration: configuration)
    }

    public func execute(_ request: GHRequest) async throws -> GHResponse {
        let urlRequest = request.makeRequest()
        let (data, urlResponse) = try await dataResponse(for: urlRequest)
        let response = GHResponse(urlResponse: urlResponse, data: data)
        return try response.validate()
    }

    private func dataResponse(for request: URLRequest) async throws -> (Data, URLResponse) {
        #if os(Linux)
        return try await data(for: request)
        #else
        if #available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *) {
            return try await session.data(for: request, delegate: nil)
        } else {
            return try await data(for: request)
        }
        #endif
    }

    private func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
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

// MARK: - GHRequest + URLRequest

extension GHRequest {
    func makeRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body
        return request
    }
}

// MARK: - GHResponse + URLResponse

extension GHResponse {
    fileprivate init(urlResponse: URLResponse, data: Data) {
        let httpResponse = urlResponse as? HTTPURLResponse
        let status = httpResponse?.statusCode ?? 200

        let allHeaderFields = httpResponse?.allHeaderFields ?? [:]
        var headers: [String: String] = [:]
        headers.reserveCapacity(allHeaderFields.count)
        httpResponse?.allHeaderFields.forEach { (key: AnyHashable, value: Any) in
            headers[String(describing: key)] = String(describing: value)
        }
        self.init(status: status, headers: headers, data: data)
    }
}
