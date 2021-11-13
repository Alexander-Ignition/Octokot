import Foundation

public struct User: Codable, Equatable {
    public var login: String
    public var id: Int
    public var nodeId: String
    public var avatarUrl: String
    public var gravatarId: String
    public var url: String
    public var htmlUrl: String
    public var followersUrl: String
    public var followingUrl: String
    public var gistsUrl: String
    public var starredUrl: String
    public var subscriptionsUrl: String
    public var organizationsUrl: String
    public var reposUrl: String
    public var eventsUrl: String
    public var receivedEventsUrl: String
    public var type: String
    public var siteAdmin: Bool
    public var name: String
    public var company: String?
    public var blog: String?
    public var location: String?
    public var email: String?
    public var hireable: Bool?
    public var bio: String?
    public var twitterUsername: String?
    public var publicRepos: Int
    public var publicGists: Int
    public var followers: Int
    public var following: Int
    public var createdAt: Date
    public var updatedAt: Date
    public var privateGists: Int
    public var totalPrivateRepos: Int
    public var ownedPrivateRepos: Int
    public var diskUsage: Int
    public var collaborators: Int
    public var twoFactorAuthentication: Bool
    public var plan: Plan

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url = "url"
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case hireable = "hireable"
        case bio = "bio"
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case privateGists = "private_gists"
        case totalPrivateRepos = "total_private_repos"
        case ownedPrivateRepos = "owned_private_repos"
        case diskUsage = "disk_usage"
        case collaborators = "collaborators"
        case twoFactorAuthentication = "two_factor_authentication"
        case plan = "plan"
    }

    public struct Plan: Codable, Equatable {
        public var name: String
        public var space: Int
        public var privateRepos: Int
        public var collaborators: Int

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case space = "space"
            case privateRepos = "private_repos"
            case collaborators = "collaborators"
        }
    }
}
