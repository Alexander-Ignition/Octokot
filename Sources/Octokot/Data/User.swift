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

    public struct Plan: Codable, Equatable {
        public var name: String
        public var space: Int
        public var privateRepos: Int
        public var collaborators: Int
    }
}
