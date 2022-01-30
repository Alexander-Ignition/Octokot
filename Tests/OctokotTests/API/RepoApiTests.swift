import XCTest
import Octokot

final class RepoApiTests: XCTestCase {

    func testGetRepo() async throws {
        await assertApi { github in
            try await github.repos["octocat"]["hello-world"]()
        } request: {
            $0.method = .GET
            $0.path = "/repos/octocat/hello-world"
        } response: {
            try Fixture("repos/octocat/hello-world.json")
        }
    }
}
