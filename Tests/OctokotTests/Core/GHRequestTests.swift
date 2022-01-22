import XCTest
@testable import Octokot

final class GHRequestTests: XCTestCase {
    private let url = URL(string: "https://example.com")!

    func testInitWithDefaultsProperties() {
        let actual = GHRequest(url: url)
        let expected = GHRequest(
            method: .GET,
            url: url,
            headers: [:],
            body: nil)
        assertEqual(actual, expected)
    }

    func testPath() {
        var request = GHRequest(url: url)
        request.path = "/repos/alex ignition"
        XCTAssertEqual(request.path, "/repos/alex ignition")
        XCTAssertEqual(request.url.absoluteString, "https://example.com/repos/alex%20ignition")
    }

    func testContentType() {
        var request = GHRequest(url: url, headers: ["X-Test": "T"])
        request.contentType = "any-type"
        XCTAssertEqual(request.contentType, "any-type")
        XCTAssertEqual(request.headers, ["X-Test": "T", "Content-Type": "any-type"])
    }

    func testEncodeQueryItems() throws {
        var request = GHRequest(url: URL(string: "https://example.com?q=text")!)
        try request.encode(queryItems: [
            URLQueryItem(name: "private", value: nil),
            URLQueryItem(name: "ord", value: "des")
        ])
        XCTAssertEqual(request.url.absoluteString, "https://example.com?q=text&private&ord=des")
    }

    func testMakeURLRequest() {
        let request = GHRequest(
            method: .POST,
            url: url,
            headers: ["X-Test": "3"],
            body: Data("text".utf8))

        let urlRequest = request.makeRequest()
        XCTAssertEqual(urlRequest.url, url)
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["X-Test": "3"])
        XCTAssertEqual(urlRequest.httpBody, Data("text".utf8))
    }
}
