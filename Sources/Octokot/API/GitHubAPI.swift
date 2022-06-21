import Foundation

public struct GitHubAPI: API {
    let context: APIContext

    public init(client: GHClient, configuration: Configuration = .default) {
        self.context = APIContext(client: client, configuration: configuration)
    }
}

extension GitHubAPI {
    
    public struct Configuration {

        public static let `default` = Configuration(
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

        /// A personal access token.
        public var accessToken: AccessToken? {
            didSet {
                headers["Authorization"] = accessToken.map { "Basic \($0.base64EncodedString)" }
            }
        }

        public init(url: URL, headers: [String : String] = [:]) {
            self.url = url
            self.headers = headers
        }
    }

    /// A personal access token.
    ///
    /// [Creating a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
    public struct AccessToken {
        public let base64EncodedString: String

        public static func base64EncodedString(_ string: String) -> AccessToken {
            AccessToken(base64EncodedString: string)
        }

        public static func string(_ string: String) -> AccessToken {
            AccessToken(base64EncodedString: Data(string.utf8).base64EncodedString())
        }
    }
}

extension GitHubAPI {
    /// The Users API allows to get public and private information about the authenticated user.
    public var user: AuthenticatedUserApi {
        AuthenticatedUserApi(context: context)
    }

    /// The Repos API allows to create, manage and control the workflow of public and private GitHub repositories.
    public var repos: ReposApi {
        ReposApi(context: context)
    }
}

// MARK: - Meta

extension GitHubAPI {
    /// GitHub API Root.
    ///
    ///     GET /
    ///
    /// Get Hypermedia links to resources accessible in GitHub's REST API.
    public func callAsFunction() async throws -> [String: String] {
        try await context.client.execute(context.configuration.request).decode()
    }

    /// Get GitHub meta information.
    ///
    ///     GET /meta
    ///
    /// - Note: The IP addresses shown in the documentation's response are only example values.
    ///         You must always query the API directly to get the latest list of IP addresses.
    /// - Returns: meta information about GitHub, including a list of GitHub's IP addresses.
    ///            For more information, see "About GitHub's IP addresses."
    public func meta() async throws -> Meta {
        try await execute {
            $0.path = "/meta"
        }.decode()
    }
}

// MARK: - Emojis

extension GitHubAPI {
    /// Get emojis.
    ///
    ///     GET /emojis
    ///
    /// Lists all the emojis available to use on GitHub.
    public func emojis() async throws -> [String: String] {
        try await execute {
            $0.path = "/emojis"
        }.decode()
    }

    public func zen() async throws -> String {
        try await execute {
            $0.path = "/zen"
        }.string
    }
}
