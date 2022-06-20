/// GitHub REST API client.
public protocol GHClient: AnyObject {
    func execute(_ request: GHRequest) async throws -> GHResponse
}
