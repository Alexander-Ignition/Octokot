@testable import Octokot
import XCTest

func GHAssertEqual(
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

func GHAssertApi<T>(
    request: (inout GHRequest) throws -> Void,
    response: () throws -> T,
    file: StaticString = #filePath,
    line: UInt = #line,
    task: (GitHubAPI) async throws -> T
) async throws where T: Codable, T: Equatable {

    let client = GHClientMock()
    var request1 = client.configuration.request
    try request(&request1)

    let response1 = try response()
    try await client.encode(response: response1)

    let api = GitHubAPI(client: client)

    let response2 = try await task(api)
    XCTAssertEqual(response2, response1, file: file, line: line)

    let requests = await client.requests
    XCTAssertEqual(requests.count, 1)
    let request2 = try XCTUnwrap(requests.first, file: file, line: line)

    GHAssertEqual(request2, request1, file: file, line: line)
}

actor GHClientMock: GHClient {
    let configuration: GHConfiguration = .default

    private(set) var requests: [GHRequest] = []
    private var result = Result<GHResponse, Error>.failure(URLError(.notConnectedToInternet))

    func execute(_ request: GHRequest) async throws -> GHResponse {
        self.requests.append(request)
        return try result.get()
    }

    func setResponse(status: Int = 200, data: Data) {
        let response = GHResponse(status: status, data: data)
        self.result = .success(response)
    }

    func encode<T>(status: Int = 200, response: T) throws where T: Encodable {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(response)
        setResponse(status: status, data: data)
    }
}
