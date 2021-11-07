import XCTest
import Octokot

final class GHRequestTests: XCTestCase {
    func testDefaultUrl() {
        XCTAssertEqual(GHRequest.url, URL(string: "https://api.github.com/")!)
    }

    func testInitWithDefaultsProperties() {
        let actual = GHRequest()
        let expected = GHRequest(
            method: .GET,
            url: URL(string: "https://api.github.com/")!,
            headers: [:],
            body: nil)
        GHAssertEqual(actual, expected)
    }
}
