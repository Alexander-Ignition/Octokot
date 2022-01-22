import XCTest
import Octokot

final class GitHubApiTests: XCTestCase {

    func testRoot() async throws {
        await assertApi { github in
            try await github()
        } request: {
            $0.method = .GET
        } response: {
            try Fixture(value: [
                "user_organizations_url": "https://api.github.com/user/orgs",
                "rate_limit_url": "https://api.github.com/rate_limit",
                "repository_url": "https://api.github.com/repos/{owner}/{repo}"
            ])
        }
    }

    func testMeta() async throws {
        await assertApi { github in
            try await github.meta()
        } request: {
            $0.method = .GET
            $0.path = "meta"
        } response: {
            try Fixture("meta.json")
        }
    }

    func testEmojis() async throws {
        await assertApi { github in
            try await github.emojis()
        } request: {
            $0.method = .GET
            $0.path = "emojis"
        } response: {
            try Fixture(value: [
                "atom": "https://github.githubassets.com/images/icons/emoji/atom.png?v8",
                "microbe": "https://github.githubassets.com/images/icons/emoji/unicode/1f9a0.png?v8",
                "green_circle": "https://github.githubassets.com/images/icons/emoji/unicode/1f7e2.png?v8"
            ])
        }
    }
}
