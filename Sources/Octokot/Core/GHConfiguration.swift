/// GitHub REST API client.
public protocol GHClient: AnyObject {
    func execute(_ request: GHRequest) async throws -> GHResponse
}

public final class GHConfiguration {
    /// Basic HTTP request.
    public var request: GHRequest = GHRequest()

    /// HTTP client.
    public var client: GHClient = GHSession.shared

    /// A new default configuration.
    public init() {}
}
