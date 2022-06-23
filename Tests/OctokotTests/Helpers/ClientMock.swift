import Foundation
@testable import Octokot

final actor ClientMock: GHClient {
    private var results: [GHRequest: Result<GHResponse, Error>]
    private(set) var requestsCount: Int = 0

    init(results: [GHRequest: Result<GHResponse, Error>] = [:]) {
        self.results = results
    }

    func setResult(_ result: Result<GHResponse, Error>, for request: GHRequest) {
        results[request] = result
    }

    func setResponse(_ response: GHResponse, for request: GHRequest) {
        setResult(.success(response), for: request)
    }

    func execute(_ request: GHRequest) async throws -> GHResponse {
        requestsCount += 1
        guard let result = results[request] else {
            let message = "Response not found \(request.url.absoluteString)"
            throw URLError(.unknown, userInfo: [NSLocalizedDescriptionKey: message])
        }
        return try result.get()
    }
}
