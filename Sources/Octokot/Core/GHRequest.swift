import Foundation

/// GitHub HTTP request.
public struct GHRequest: Hashable {
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
}

// MARK: - URL Components

extension GHRequest {
    public mutating func appendPath(_ path: String) {
        url.appendPathComponent(path)
    }

    public var queryItems: [URLQueryItem] {
        get {
            return urlComponents?.queryItems ?? []
        }
        set {
            guard !newValue.isEmpty else {
                return
            }
            guard var components = urlComponents else {
                return
            }
            var items = components.queryItems ?? []
            items.append(contentsOf: newValue)
            components.queryItems = items

            guard let url = components.url else {
                return
            }
            self.url = url
        }
    }

    private var urlComponents: URLComponents? {
        URLComponents(url: url, resolvingAgainstBaseURL: true)
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
