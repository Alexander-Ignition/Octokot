import Foundation
@testable import Octokot
import XCTest

struct Fixture<Value>: Equatable where Value: Equatable {
    /// Expected result value.
    let value: Value

    /// Mocked client response.
    var response: GHResponse
}

extension Fixture where Value: Decodable {
    init(_ path: String) throws {
        let data = try Resources.shared.data("Fixtures/\(path)")
        let response = GHResponse(status: 200, data: data)
        self.value = try XCTUnwrap(try response.decode(Value.self))
        self.response = response
    }
}

extension Fixture where Value: Encodable {
    init(value: Value) throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(value)
        self.response = GHResponse(status: 200, data: data)
        self.value = value
    }
}

extension Fixture where Value == String {
    init(string: Value) throws {
        let data = Data(string.utf8)
        self.response = GHResponse(status: 200, data: data)
        self.value = string
    }
}

extension Fixture {
    func header(_ name: String, _ value: String) -> Fixture<Value> {
        var copy = self
        copy.response.headers[name] = value
        return copy
    }
}
