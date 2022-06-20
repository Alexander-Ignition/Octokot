import Foundation

/// Repositories
///
/// The Repos API allows to create, manage and control the workflow of public and private GitHub repositories.
@dynamicMemberLookup
public struct ReposApi: API {
    let client: GHClient

    public subscript(dynamicMember owner: String) -> RepoOwnerApi {
        self[owner]
    }

    public subscript(owner: String) -> RepoOwnerApi {
        RepoOwnerApi(client: client, owner: owner)
    }
}

@dynamicMemberLookup
public struct RepoOwnerApi: API {
    let client: GHClient
    let owner: String

    public subscript(dynamicMember repo: String) -> RepoApi {
        self[owner]
    }

    public subscript(repo: String) -> RepoApi {
        RepoApi(client: client, owner: owner, repo: repo)
    }
}

public struct RepoApi: API {
    let client: GHClient
    let owner: String
    let repo: String

    /// Get a repository.
    public func callAsFunction() async throws -> Repository {
        try await execute {
            $0.method = .GET
            $0.path = "/repos/\(owner)/\(repo)"
        }.decode()
    }
}
