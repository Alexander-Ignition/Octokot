import XCTest
@testable import Octokot

final class PaginationLinksTests: XCTestCase {

    func testParseNext() {
        let string = #"<https://api.github.com/search/code?q=addClass+user%3Amozilla&page=16>; rel="next""#
        let links = PaginationLinks(string: string)
        XCTAssertEqual(links.next?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=16")
        XCTAssertNil(links.prev)
        XCTAssertNil(links.first)
        XCTAssertNil(links.last)
    }

    func testParsePrev() {
        let string = #"<https://api.github.com/search/code?q=addClass+user%3Amozilla&page=103>; rel="prev""#
        let links = PaginationLinks(string: string)
        XCTAssertNil(links.next)
        XCTAssertEqual(links.prev?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=103")
        XCTAssertNil(links.first)
        XCTAssertNil(links.last)
    }

    func testParseFirst() {
        let string = #"<https://api.github.com/search/code?q=addClass+user%3Amozilla&page=1>; rel="first""#
        let links = PaginationLinks(string: string)
        XCTAssertNil(links.next)
        XCTAssertNil(links.prev)
        XCTAssertEqual(links.first?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=1")
        XCTAssertNil(links.last)
    }

    func testParseLast() {
        let string = #"<https://api.github.com/search/code?q=addClass+user%3Amozilla&page=134>; rel="last""#
        let links = PaginationLinks(string: string)
        XCTAssertNil(links.next)
        XCTAssertNil(links.prev)
        XCTAssertNil(links.first)
        XCTAssertEqual(links.last?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=134")
    }

    func testParse() {
        let string = """
         <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=15>; rel="next",
           <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=34>; rel="last",
           <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=1>; rel="first",
           <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=13>; rel="prev"
        """
        let links = PaginationLinks(string: string)
        XCTAssertEqual(links.next?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=15")
        XCTAssertEqual(links.last?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=34")
        XCTAssertEqual(links.first?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=1")
        XCTAssertEqual(links.prev?.absoluteString, "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=13")
    }

    func testParseEmptyString() {
        let links = PaginationLinks(string: "")
        XCTAssertNil(links.next)
        XCTAssertNil(links.prev)
        XCTAssertNil(links.first)
        XCTAssertNil(links.last)
    }

    func testParseInvalidURL() {
        let string = #"<https:// api.github.com/search/code?q=addClass+user%3Amozilla&page=134>; rel="next""#
        let links = PaginationLinks(string: string)
        XCTAssertNil(links.next)
        XCTAssertNil(links.prev)
        XCTAssertNil(links.first)
        XCTAssertNil(links.last)
    }

    func testParseUnknownRel() {
        let string = #"<https://api.github.com/search/code?q=addClass+user%3Amozilla&page=134>; rel="favorite""#
        let links = PaginationLinks(string: string)
        XCTAssertNil(links.next)
        XCTAssertNil(links.prev)
        XCTAssertNil(links.first)
        XCTAssertNil(links.last)
    }
}
