import Foundation

public struct GHConfiguration {

    public static let `default` = GHConfiguration(
        url: URL(string: "https://api.github.com/")!,
        headers: [
            "Accept": "application/vnd.github.v3+json"
        ])

    /// Base  URL.
    public var url: URL

    /// HTTP request method.
    public var headers: [String: String]

    /// Base HTTP request.
    public var request: GHRequest {
        GHRequest(url: url, headers: headers)
    }

    public init(url: URL, headers: [String : String] = [:]) {
        self.url = url
        self.headers = headers
    }
}
