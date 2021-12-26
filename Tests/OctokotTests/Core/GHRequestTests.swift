import XCTest
import Octokot

final class GHRequestTests: XCTestCase {
    func testInitWithDefaultsProperties() {
        let url = URL(string: "/")!
        let actual = GHRequest(url: url)
        let expected = GHRequest(
            method: .GET,
            url: url,
            headers: [:],
            body: nil)
        GHAssertEqual(actual, expected)
    }
}
