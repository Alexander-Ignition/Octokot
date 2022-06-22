import Foundation

public struct Repository: Codable, Equatable {
    public var id: Int
    public var nodeId: String
    public var name: String
    public var fullName: String?
    public var owner: Organization?
    public var `private`: Bool
    public var htmlUrl: String?
    public var description: String?
    public var fork: Bool
    public var url: String
    public var archiveUrl: String?
    public var assigneesUrl: String?
    public var blobsUrl: String?
    public var branchesUrl: String?
    public var collaboratorsUrl: String?
    public var commentsUrl: String?
    public var commitsUrl: String?
    public var compareUrl: String?
    public var contentsUrl: String?
    public var contributorsUrl: String?
    public var deploymentsUrl: String?
    public var downloadsUrl: String?
    public var eventsUrl: String?
    public var forksUrl: String?
    public var gitCommitsUrl: String?
    public var gitRefsUrl: String?
    public var gitTagsUrl: String?
    public var gitUrl: String?
    public var issueCommentUrl: String?
    public var issueEventsUrl: String?
    public var issuesUrl: String?
    public var keysUrl: String?
    public var labelsUrl: String?
    public var languagesUrl: String?
    public var mergesUrl: String?
    public var milestonesUrl: String?
    public var notificationsUrl: String?
    public var pullsUrl: String?
    public var releasesUrl: String?
    public var sshUrl: String?
    public var stargazersUrl: String?
    public var statusesUrl: String?
    public var subscribersUrl: String?
    public var subscriptionUrl: String?
    public var tagsUrl: String?
    public var teamsUrl: String?
    public var treesUrl: String?
    public var cloneUrl: String?
    public var mirrorUrl: String?
    public var hooksUrl: String?
    public var svnUrl: String?
    public var homepage: String?
    public var language: String?
    public var forksCount: Int?
    public var forks: Int?
    public var stargazersCount: Int?
    public var watchersCount: Int?
    public var watchers: Int?
    public var size: Int?
    public var defaultBranch: String?
    public var openIssuesCount: Int?
    public var openIssues: Int?
    public var isTemplate: Bool?
    public var topics: [String]?
    public var hasIssues: Bool?
    public var hasProjects: Bool?
    public var hasWiki: Bool?
    public var hasPages: Bool?
    public var hasDownloads: Bool?
    public var archived: Bool?
    public var disabled: Bool?
    public var visibility: String?
    public var pushedAt: Date?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var permissions: Permissions?
    public var allowRebaseMerge: Bool?
    public var templateRepository: Parent?
    public var tempCloneToken: String?
    public var allowSquashMerge: Bool?
    public var allowAutoMerge: Bool?
    public var deleteBranchOnMerge: Bool?
    public var allowMergeCommit: Bool?
    public var subscribersCount: Int?
    public var networkCount: Int?
    public var license: License?
    public var organization: Organization?
    public var parent: Parent?
    public var source: Parent?
}

extension Repository {
    public struct License: Codable, Equatable {
        public var key: String
        public var name: String
        public var spdxId: String
        public var url: String
        public var nodeId: String
        public var htmlUrl: String?

        public init(
            key: String,
            name: String,
            spdxId: String,
            url: String,
            nodeId: String,
            htmlUrl: String?
        ) {
            self.key = key
            self.name = name
            self.spdxId = spdxId
            self.url = url
            self.nodeId = nodeId
            self.htmlUrl = htmlUrl
        }
    }

    public struct Organization: Codable, Equatable {
        public var login: String?
        public var id: Int?
        public var nodeId: String?
        public var avatarUrl: String?
        public var gravatarId: String?
        public var url: String?
        public var htmlUrl: String?
        public var followersUrl: String?
        public var followingUrl: String?
        public var gistsUrl: String?
        public var starredUrl: String?
        public var subscriptionsUrl: String?
        public var organizationsUrl: String?
        public var reposUrl: String?
        public var eventsUrl: String?
        public var receivedEventsUrl: String?
        public var type: String?
        public var siteAdmin: Bool?

        public init(
            login: String,
            id: Int,
            nodeId: String?,
            avatarUrl: String?,
            gravatarId: String?,
            url: String,
            htmlUrl: String,
            followersUrl: String,
            followingUrl: String,
            gistsUrl: String,
            starredUrl: String,
            subscriptionsUrl: String,
            organizationsUrl: String,
            reposUrl: String,
            eventsUrl: String,
            receivedEventsUrl: String,
            type: String,
            siteAdmin: Bool
        ) {
            self.login = login
            self.id = id
            self.nodeId = nodeId
            self.avatarUrl = avatarUrl
            self.gravatarId = gravatarId
            self.url = url
            self.htmlUrl = htmlUrl
            self.followersUrl = followersUrl
            self.followingUrl = followingUrl
            self.gistsUrl = gistsUrl
            self.starredUrl = starredUrl
            self.subscriptionsUrl = subscriptionsUrl
            self.organizationsUrl = organizationsUrl
            self.reposUrl = reposUrl
            self.eventsUrl = eventsUrl
            self.receivedEventsUrl = receivedEventsUrl
            self.type = type
            self.siteAdmin = siteAdmin
        }
    }

    public struct Parent: Codable, Equatable {
        public var id: Int
        public var nodeId: String
        public var name: String
        public var fullName: String?
        public var owner: Organization?
        public var parentPrivate: Bool?
        public var htmlUrl: String?
        public var parentDescription: String?
        public var fork: Bool?
        public var url: String?
        public var archiveUrl: String?
        public var assigneesUrl: String?
        public var blobsUrl: String?
        public var branchesUrl: String?
        public var collaboratorsUrl: String?
        public var commentsUrl: String?
        public var commitsUrl: String?
        public var compareUrl: String?
        public var contentsUrl: String?
        public var contributorsUrl: String?
        public var deploymentsUrl: String?
        public var downloadsUrl: String?
        public var eventsUrl: String?
        public var forksUrl: String?
        public var gitCommitsUrl: String?
        public var gitRefsUrl: String?
        public var gitTagsUrl: String?
        public var gitUrl: String?
        public var issueCommentUrl: String?
        public var issueEventsUrl: String?
        public var issuesUrl: String?
        public var keysUrl: String?
        public var labelsUrl: String?
        public var languagesUrl: String?
        public var mergesUrl: String?
        public var milestonesUrl: String?
        public var notificationsUrl: String?
        public var pullsUrl: String?
        public var releasesUrl: String?
        public var sshUrl: String?
        public var stargazersUrl: String?
        public var statusesUrl: String?
        public var subscribersUrl: String?
        public var subscriptionUrl: String?
        public var tagsUrl: String?
        public var teamsUrl: String?
        public var treesUrl: String?
        public var cloneUrl: String?
        public var mirrorUrl: String?
        public var hooksUrl: String?
        public var svnUrl: String?
        public var homepage: String?
        public var language: String?
        public var forksCount: Int?
        public var stargazersCount: Int?
        public var watchersCount: Int?
        public var size: Int?
        public var defaultBranch: String?
        public var openIssuesCount: Int?
        public var isTemplate: Bool?
        public var topics: [String]?
        public var hasIssues: Bool?
        public var hasProjects: Bool?
        public var hasWiki: Bool?
        public var hasPages: Bool?
        public var hasDownloads: Bool?
        public var archived: Bool?
        public var disabled: Bool?
        public var visibility: String?
        public var pushedAt: Date?
        public var createdAt: Date?
        public var updatedAt: Date?
        public var permissions: Permissions?
        public var allowRebaseMerge: Bool?
        public var tempCloneToken: String?
        public var allowSquashMerge: Bool?
        public var allowAutoMerge: Bool?
        public var deleteBranchOnMerge: Bool?
        public var allowMergeCommit: Bool?
        public var subscribersCount: Int?
        public var networkCount: Int?
        public var license: License?
        public var forks: Int?
        public var openIssues: Int?
        public var watchers: Int?
    }

    public struct Permissions: Codable, Equatable {
        public var pull: Bool
        public var push: Bool
        public var admin: Bool

        public init(pull: Bool, push: Bool, admin: Bool) {
            self.pull = pull
            self.push = push
            self.admin = admin
        }
    }
}
