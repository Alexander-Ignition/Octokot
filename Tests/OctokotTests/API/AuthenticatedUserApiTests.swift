import XCTest
import Octokot

final class AuthenticatedUserApiTests: XCTestCase {

    func testUser() async throws {
        try await GHAssertApi {
            $0.method = .GET
            $0.path = "user"
        } response: {
            try Fixtures.decode(User.self, at: "user/get.json")
        } task: { github in
            try await github.user()
        }
    }
}
