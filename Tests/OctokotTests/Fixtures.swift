import Foundation
@testable import Octokot
import XCTest

enum Fixtures {
    static let bundle = Bundle.module

    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    static func decode<T>(_ type: T.Type, at path: String) throws -> T where T: Decodable {
        guard let url = bundle.url(forResource: "Fixtures/\(path)", withExtension: nil) else {
            throw URLError(.badURL, userInfo: [NSLocalizedDescriptionKey: "Resource not found: \(path)"])
        }
        let data = try Data(contentsOf: url)
        let value = try XCTUnwrap(try decoder.decode(T.self, from: data))
        return value
    }
}
