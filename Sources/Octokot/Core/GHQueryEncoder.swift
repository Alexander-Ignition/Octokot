import Foundation

final class GHQueryEncoder {

    func encode<T>(_ value: T) throws -> [URLQueryItem] where T: Encodable {
        let context = URLQueryCodingContext()
        let encoder = URLQueryEncoder(context: context)
        try value.encode(to: encoder)
        return context.queryItems
    }

    func encode<T>(_ value: T, to url: inout URL) throws where T: Encodable {
        let queryItems = try encode(value)
        try url.appendQuery(items: queryItems)
    }
}

// MARK: - URL + URLQueryItem

extension URL {
    mutating func appendQuery(items: [URLQueryItem]) throws {
        self = try self.appendingQuery(items: items)
    }

    func appendingQuery(items: [URLQueryItem]) throws -> URL {
        guard items.isEmpty else {
            return self
        }
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            throw URLError(.badURL)
        }
        components.queryItems = items
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return url
    }
}

// MARK: - Encoding implementation

final class URLQueryCodingContext {
    var queryItems: [URLQueryItem] = []
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey: Any] = [:]

    @inlinable
    func append<Value, Key>(
        _ value: Value,
        forKey key: Key
    ) where Value: CustomStringConvertible, Key: CodingKey {
        let value = String(describing: value)
        let item = URLQueryItem(name: key.stringValue, value: value)
        queryItems.append(item)
    }
}

struct URLQueryEncoder: Encoder {
    let context: URLQueryCodingContext

    var codingPath: [CodingKey] { context.codingPath }
    var userInfo: [CodingUserInfoKey: Any] { context.userInfo }

    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        let container = URLQueryKeyedEncoder<Key>(context: context)
        return KeyedEncodingContainer<Key>(container)
    }

    func unkeyedContainer() -> UnkeyedEncodingContainer {
        fatalError("Unimplemented: \(#function)")
    }

    func singleValueContainer() -> SingleValueEncodingContainer {
        fatalError("Unimplemented: \(#function)")
    }
}

struct URLQueryKeyedEncoder<Key>: KeyedEncodingContainerProtocol where Key: CodingKey {
    let context: URLQueryCodingContext

    var codingPath: [CodingKey] { context.codingPath }

    mutating func encodeNil(forKey key: Key) throws {
        // noop
    }

    mutating func encode(_ value: Bool, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: String, forKey key: Key) throws {
        context.queryItems.append(URLQueryItem(name: key.stringValue, value: value))
    }

    mutating func encode(_ value: Double, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: Float, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: Int, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: Int8, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: Int16, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: Int32, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: Int64, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: UInt, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: UInt8, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: UInt16, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: UInt32, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode(_ value: UInt64, forKey key: Key) throws {
        context.append(value, forKey: key)
    }

    mutating func encode<T>(_ value: T, forKey key: Key) throws where T: Encodable {
        context.codingPath.append(key)
        defer {
            context.codingPath.removeLast()
        }
        let encoder = URLQueryEncoder(context: context)
        try value.encode(to: encoder)
    }

    mutating func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError("Unimplemented: \(#function)")
    }

    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        fatalError("Unimplemented: \(#function)")
    }

    mutating func superEncoder() -> Encoder {
        fatalError("Unimplemented: \(#function)")
    }

    mutating func superEncoder(forKey key: Key) -> Encoder {
        fatalError("Unimplemented: \(#function)")
    }
}
