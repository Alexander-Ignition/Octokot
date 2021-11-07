import XCTest
import Octokot

final class GitHubApiTests: XCTestCase {

    func testRoot() async throws {
        try await GHAssertApi {
            $0.method = .GET
        } response: {
            [
                "a": "1",
                "b": "2"
            ]
        } task: { github in
            try await github()
        }
    }

    func testEmojis() async throws {
        try await GHAssertApi {
            $0.method = .GET
            $0.path = "emojis"
        } response: {
            [
                "smile": "link1",
                "sun": "link2"
            ]
        } task: { github in
            try await github.emojis()
        }
    }
}
