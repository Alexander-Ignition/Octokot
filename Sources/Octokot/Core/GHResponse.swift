import Foundation

public struct GHResponse: Equatable {
    public let data: Data

    public let response: URLResponse?

    public var httpResponse: HTTPURLResponse? { response as? HTTPURLResponse }

    public var statusCode: Int { httpResponse?.statusCode ?? 0 }

    public init(response: URLResponse?, data: Data?) {
        self.response = response
        self.data = data ?? Data()
    }

    /// UTF8 string representation of body.
    public var string: String {
        String(decoding: data, as: UTF8.self)
    }

    func value(forHTTPHeaderField field: String) -> String? {
        if #available(macOS 10.15, *) {
            return httpResponse?.value(forHTTPHeaderField: field)
        } else {
            return httpResponse?.allHeaderFields[field] as? String
        }
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
