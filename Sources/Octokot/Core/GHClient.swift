/// GitHub REST API client.
public protocol GHClient: AnyObject {
    var configuration: GHConfiguration { get }

    func execute(_ request: GHRequest) async throws -> GHResponse
}
