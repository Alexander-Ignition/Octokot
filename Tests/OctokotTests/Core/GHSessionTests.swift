import XCTest
import Octokot

final class GHSessionTests: XCTestCase {
    func testShared() throws {
        let urlSession = GHSession.shared.session
        XCTAssertEqual(urlSession.sessionDescription, "GitHub")

        let configuration = urlSession.configuration
        XCTAssertEqual(configuration.httpAdditionalHeaders as? [String: String], [
            "Accept": "application/vnd.github.v3+json"
        ])
    }
}
