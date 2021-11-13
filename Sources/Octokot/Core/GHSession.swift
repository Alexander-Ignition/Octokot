import Foundation

public final class GHSession: GHClient {
    public static let shared = GHSession(configuration: configuration)

    /// Default session configuration.
    public static var configuration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Accept": "application/vnd.github.v3+json"
        ]
        return configuration
    }

    public let session: URLSession

    public init(session: URLSession) {
        self.session = session
    }

    public convenience init(configuration: URLSessionConfiguration) {
        let session = URLSession(configuration: configuration)
        session.sessionDescription = "GitHub"
        self.init(session: session)
    }

    public func execute(_ request: GHRequest) async throws -> GHResponse {
        let urlRequest = request.makeRequest()
        let (data, urlResponse) = try await session.data(for: urlRequest, delegate: nil)
        let httpResponse = urlResponse as? HTTPURLResponse
        let status = httpResponse?.statusCode ?? 200
        let response = GHResponse(status: status, data: data)
        return try response.validate()
    }
}
