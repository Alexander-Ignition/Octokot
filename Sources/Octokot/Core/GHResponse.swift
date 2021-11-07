import Foundation

public struct GHResponse: Equatable {
    public var status: Int
    public var data: Data

    public init(status: Int, data: Data) {
        self.status = status
        self.data = data
    }

    /// UTF8 string representation of body.
    public var string: String {
        String(decoding: data, as: UTF8.self)
    }

    func validate() throws -> GHResponse {
        // TODO: check http code and body
        return self
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

    public func decode<T>() throws -> T where T: Decodable {
        return try Self.decoder.decode(T.self, from: data)
    }
}
