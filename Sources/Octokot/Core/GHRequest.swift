import Foundation

/// GitHub HTTP request.
public struct GHRequest: Equatable {
    /// HTTP request method.
    public enum Method: String {
        case GET
        case POST
        case PATCH
        case DELETE
    }

    /// HTTP request method. Default `GET`.
    public var method: Method

    /// HTTP request url.
    public var url: URL

    /// HTTP request method. Default `empty`.
    public var headers: [String: String]

    /// HTTP request body. Default `nil`.
    public var body: Data?

    public init(
        method: Method = .GET,
        url: URL,
        headers: [String: String] = [:],
        body: Data? = nil
    ) {
        self.method = method
        self.url = url
        self.headers = headers
        self.body = body
    }

    public var path: String {
        get {
            url.path
        }
        set {
            url.appendPathComponent(newValue)
        }
    }
}

// MARK: - Headers

extension GHRequest {

    public var contentType: String? {
        get {
            return headers["Content-Type"]
        }
        set {
            headers["Content-Type"] = newValue
        }
    }
}

// MARK: - Encoding

extension GHRequest {

    public mutating func encode(queryItems: [URLQueryItem]) throws {
        try url.appendQueryItems(queryItems)
    }

    public mutating func encode<T>(body value: T) throws where T: Encodable {
        let encoder = JSONEncoder()
        body = try encoder.encode(value)
    }
}

// MARK: - URL + URLQueryItem

extension URL {
    fileprivate mutating func appendQueryItems(_ queryItems: [URLQueryItem]) throws {
        guard !queryItems.isEmpty else {
            return
        }
        self = try self.appendingQuery(queryItems: queryItems)
    }

    private func appendingQuery(queryItems: [URLQueryItem]) throws -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            throw URLError(.badURL)
        }
        if var items = components.queryItems {
            items.append(contentsOf: queryItems)
            components.queryItems = items
        } else {
            components.queryItems = queryItems
        }
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return url
    }
}
