import Foundation

public final class GHSession: GHClient {
    public static let shared: GHSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Accept": "application/vnd.github.v3+json"
        ]
        let session = URLSession(configuration: configuration)
        session.sessionDescription = "GitHub"
        return GHSession(urlSession: session)
    }()

    public let urlSession: URLSession

    public init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    public func execute(_ request: GHRequest) async throws -> GHResponse {
        let urlRequest = request.makeRequest()
        let (data, urlResponse) = try await urlSession.data(for: urlRequest, delegate: nil)
        let httpResponse = urlResponse as? HTTPURLResponse
        let status = httpResponse?.statusCode ?? 200
        let response = GHResponse(status: status, data: data)
        return try response.validate()
    }
}
