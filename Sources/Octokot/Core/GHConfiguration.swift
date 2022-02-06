import Foundation

public struct GHConfiguration {

    public static let `default` = GHConfiguration(
        url: URL(string: "https://api.github.com")!,
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

    /// Set a personal access token.
    ///
    /// [Creating a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
    ///
    /// - Parameter token: a personal access token.
    public mutating func setAccessToken(_ token: String) {
        let base64 = Data(token.utf8).base64EncodedString()
        setAccessToken(base64: base64)
    }

    /// Set a personal access token.
    ///
    /// [Creating a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
    ///
    /// - Parameter token: base64 encoded string.
    public mutating func setAccessToken(base64 token: String) {
        headers["Authorization"] = "Basic \(token)"
    }
}
