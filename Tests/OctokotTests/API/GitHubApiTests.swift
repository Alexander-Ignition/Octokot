import XCTest
import Octokot

final class GitHubApiTests: XCTestCase {

    func testRoot() async throws {
        try await GHAssertApi {
            $0.method = .GET
        } response: {
            [
                "user_organizations_url": "https://api.github.com/user/orgs",
                "rate_limit_url": "https://api.github.com/rate_limit",
                "repository_url": "https://api.github.com/repos/{owner}/{repo}"
            ]
        } task: { github in
            try await github()
        }
    }

    func testMeta() async throws {
        try await GHAssertApi {
            $0.method = .GET
            $0.path = "meta"
        } response: {
            try Fixtures.decode(Meta.self, at: "meta.json")
        } task: { github in
            try await github.meta()
        }
    }

    func testEmojis() async throws {
        try await GHAssertApi {
            $0.method = .GET
            $0.path = "emojis"
        } response: {
            [
                "atom": "https://github.githubassets.com/images/icons/emoji/atom.png?v8",
                "microbe": "https://github.githubassets.com/images/icons/emoji/unicode/1f9a0.png?v8",
                "green_circle": "https://github.githubassets.com/images/icons/emoji/unicode/1f7e2.png?v8"
            ]
        } task: { github in
            try await github.emojis()
        }
    }
}
