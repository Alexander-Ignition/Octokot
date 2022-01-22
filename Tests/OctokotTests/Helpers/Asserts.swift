@testable import Octokot
import XCTest

func assertEqual(
    _ request1: GHRequest,
    _ request2: GHRequest,
    file: StaticString = #filePath,
    line: UInt = #line
) {
    XCTAssertEqual(request1.method, request2.method, file: file, line: line)
    XCTAssertEqual(request1.url, request2.url, file: file, line: line)
    XCTAssertEqual(request1.headers, request2.headers, file: file, line: line)
    XCTAssertEqual(request1.body, request2.body, file: file, line: line)
}

func assertApi<T>(
    _ api: (GitHubAPI) async throws -> T,
    request: (inout GHRequest) throws -> Void,
    response: () throws -> Fixture<T>,
    file: StaticString = #filePath,
    line: UInt = #line
) async where T: Codable & Equatable {
    do {
        let client = ClientMock()
        let github = GitHubAPI(client: client)

        var request1 = client.configuration.request
        try request(&request1)

        let fixture = try response()
        await client.setResponse(fixture.response, for: request1)

        let value = try await api(github)
        XCTAssertEqual(value, fixture.value, file: file, line: line)

        let requestsCount = await client.requestsCount
        XCTAssertEqual(requestsCount, 1, file: file, line: line)
    } catch {
        XCTFail("Error: \(error)", file: file, line: line)
    }
}
