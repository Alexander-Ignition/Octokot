import Foundation

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
        let (data, urlResponse) = try await session.backport.data(for: urlRequest)
        let response = GHResponse(urlResponse: urlResponse, data: data)
        return try response.validate()
    }
}
