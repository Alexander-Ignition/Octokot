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
    enum Encoders {
        static let query = GHQueryEncoder()
        static let json = JSONEncoder()
    }

    public mutating func encode<T>(query value: T) throws where T: Encodable {
        try Encoders.query.encode(value, to: &url)
    }

    public mutating func encode<T>(body value: T) throws where T: Encodable {
        body = try Encoders.json.encode(value)
    }
}

// MARK: - GHRequest + URLRequest

extension GHRequest {

    func makeRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body
        return request
    }
}
