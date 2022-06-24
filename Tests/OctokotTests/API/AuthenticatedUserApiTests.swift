import XCTest
import Octokot

final class AuthenticatedUserApiTests: XCTestCase {

    func testUser() async {
        await assertApi { github in
            try await github.user()
        } request: {
            $0.method = .GET
            $0.appendPath("/user")
        } response: {
            try Fixture("user/get.json")
        }
    }
}
