@testable import Octokot
import XCTest

final class PaginationTests: XCTestCase {

    private let paths = [
        "/numbers?page=0",
        "/numbers?page=1",
        "/numbers?page=2",
        "/numbers?page=3",
    ]
    private let pages: [[Int]] = [
        [1, 2],
        [3, 4],
        [5, 6],
        [7, 8]
    ]
    private var paginations: [Pagination<Int>]!
    private var client: ClientMock!
    private var api: NumbersApi!

    override func setUp() {
        super.setUp()
        precondition(paths.count == paths.count)

        let configuration = GitHubAPI.Configuration.default
        let baseURL = configuration.url
        let urls: [URL] = paths.map { path in
            URL(string: path, relativeTo: baseURL)!.absoluteURL
        }
        let links: [PaginationLinks] = [
            PaginationLinks(next: urls[1], last: urls[3], first: urls[0], prev: nil),
            PaginationLinks(next: urls[2], last: urls[3], first: urls[0], prev: urls[0]),
            PaginationLinks(next: urls[3], last: urls[3], first: urls[0], prev: urls[1]),
            PaginationLinks(next: nil,     last: urls[3], first: urls[0], prev: urls[1])
        ]
        var results: [GHRequest: Result<GHResponse, Error>] = [:]
        for (index, url) in urls.enumerated() {
            var request = configuration.request
            request.url = url
            var response = GHResponse(status: 200, data: Data("\(pages[index])".utf8))
            response.headers["Link"] = links[index].httpHeaderField
            results[request] = .success(response)
        }
        client = ClientMock(results: results)
        let context = APIContext(client: client, configuration: configuration)
        paginations = paths.indices.map { index in
            Pagination(context: context, items: pages[index], links: links[index])
        }
        api = NumbersApi(context: context)
    }

    func testPagination() async throws {
        var numbers: [Int] = []

        numbers += try await api.numbers(page: 0).items
        numbers += try await api.numbers(page: 1).items

        XCTAssertEqual(numbers, [1, 2, 3, 4])
    }

    func testNext() async throws {
        let pagination = try await api.numbers(page: 0)
        assertEqual(pagination, paginations[0])

        let next = try await pagination.next
        assertEqual(next, paginations[1])
    }

    func testPrevious() async throws {
        let pagination = try await api.numbers(page: 1)
        assertEqual(pagination, paginations[1])

        let previous = try await pagination.previous
        assertEqual(previous, paginations[0])
    }

    func testFirst() async throws {
        let pagination = try await api.numbers(page: 2)
        assertEqual(pagination, paginations[2])

        let first = try await pagination.first
        assertEqual(first, paginations[0])
    }

    func testLast() async throws {
        let pagination = try await api.numbers(page: 0)
        assertEqual(pagination, paginations[0])

        let last = try await pagination.last
        assertEqual(last, paginations[3])
    }

    func testAsyncSequence() async throws {
        let pagination = try await api.numbers(page: 0)
        var numbers: [Int] = []

        for try await page in pagination {
            numbers.append(contentsOf: page.items)
        }
        XCTAssertEqual(numbers, [1, 2, 3, 4, 5, 6, 7, 8])
    }

    private func assertEqual(
        _ pagination1: Pagination<Int>?,
        _ pagination2: Pagination<Int>,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        guard let pagination1 = pagination1 else {
            return XCTFail("pagination1 == nil", file: file, line: line)
        }
        XCTAssertEqual(pagination1.items, pagination2.items, file: file, line: line)
        XCTAssertEqual(pagination1.links, pagination2.links, file: file, line: line)
        XCTAssertTrue(pagination1.context === pagination2.context, file: file, line: line)
    }
}

fileprivate struct NumbersApi: API {
    let context: APIContext

    func numbers(page: Int) async throws -> Pagination<Int> {
        try await pagination {
            $0.path = "numbers"
            try $0.encode(queryItems: [URLQueryItem(name: "page", value: "\(page)")])
        }
    }
}

extension PaginationLinks {
    fileprivate var httpHeaderField: String {
        var items: [String] = []
        if let url = next?.absoluteString {
            items.append("<\(url)>; rel=\"next\"")
        }
        if let url = last?.absoluteString {
            items.append("<\(url)>; rel=\"last\"")
        }
        if let url = first?.absoluteString {
            items.append("<\(url)>; rel=\"first\"")
        }
        if let url = prev?.absoluteString {
            items.append("<\(url)>; rel=\"prev\"")
        }
        return items.joined(separator: ", ")
    }
}
