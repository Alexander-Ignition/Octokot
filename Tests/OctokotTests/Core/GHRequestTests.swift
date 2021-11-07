import XCTest
import Octokot

final class GHRequestTests: XCTestCase {
    func testDefaultUrl() {
        XCTAssertEqual(GHRequest.url, URL(string: "https://api.github.com/")!)
    }

    func testInitWithDefaultsProperties() {
        let request = GHRequest()
        XCTAssertEqual(request.method, .GET)
        XCTAssertEqual(request.url, URL(string: "https://api.github.com/")!)
        XCTAssertEqual(request.headers, [:])
        XCTAssertNil(request.body)
    }
}
