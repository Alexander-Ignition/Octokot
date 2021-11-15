import XCTest
import Octokot

final class RepoApiTests: XCTestCase {

    func testGetRepo() async throws {
        try await GHAssertApi {
            $0.method = .GET
            $0.path = "repos/octocat/hello-world"
        } response: {
            try Fixtures.decode(Repository.self, at: "repos/octocat/hello-world.json")
        } task: { github in
            try await github.repos["octocat"]["hello-world"]()
        }
    }
}
