import Foundation

public struct AuthenticatedUserApi: API {
    let context: APIContext

    /// Get the authenticated user.
    ///
    /// If the authenticated user is authenticated through basic authentication or OAuth with the **user** scope,
    /// then the response lists public and private profile information.
    ///
    /// If the authenticated user is authenticated through OAuth without the **user** scope,
    /// then the response lists only public profile information.
    ///
    /// - Returns: the authenticated user.
    public func callAsFunction() async throws -> User {
        try await execute(.GET, "/user").decode()
    }
}
