import Foundation

public struct GHResponse: Equatable {
    public var status: Int
    public var headers: [String: String]
    public var data: Data

    public init(status: Int, headers: [String: String] = [:], data: Data) {
        self.status = status
        self.headers = headers
        self.data = data
    }

    /// UTF8 string representation of body.
    public var string: String {
        String(decoding: data, as: UTF8.self)
    }

    func validate() throws -> GHResponse {
        if status == 200 {
            return self
        }
        if let error = try? decode(GHError.self) {
            throw error
        }
        throw GHError.http(status: status)
    }
}

extension GHResponse: CustomDebugStringConvertible {
    public var debugDescription: String { string }
}

// MARK: - Decoding

extension GHResponse {
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    public func decode<T>(_ type: T.Type = T.self) throws -> T where T: Decodable {
        return try Self.decoder.decode(T.self, from: data)
    }
}
