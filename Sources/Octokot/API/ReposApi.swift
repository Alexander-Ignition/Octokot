import Foundation

/// Repositories
///
/// The Repos API allows to create, manage and control the workflow of public and private GitHub repositories.
@dynamicMemberLookup
public struct ReposApi: API {
    let context: APIContext

    public subscript(dynamicMember owner: String) -> RepoOwnerApi {
        self[owner]
    }

    public subscript(owner: String) -> RepoOwnerApi {
        RepoOwnerApi(context: context, owner: owner)
    }
}

@dynamicMemberLookup
public struct RepoOwnerApi: API {
    let context: APIContext
    let owner: String

    public subscript(dynamicMember repo: String) -> RepoApi {
        self[owner]
    }

    public subscript(repo: String) -> RepoApi {
        RepoApi(context: context, owner: owner, repo: repo)
    }
}

public struct RepoApi: API {
    let context: APIContext
    let owner: String
    let repo: String

    /// Get a repository.
    public func callAsFunction() async throws -> Repository {
        try await execute(.GET, "/repos/\(owner)/\(repo)").decode()
    }
}
