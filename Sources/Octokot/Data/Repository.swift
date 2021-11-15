import Foundation

public struct Repository: Codable, Equatable {
    public var id: Int
    public var nodeId: String
    public var name: String
    public var fullName: String?
    public var owner: Organization?
    public var repositoryPrivate: Bool
    public var htmlUrl: String?
    public var repositoryDescription: String?
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

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeId = "node_id"
        case name = "name"
        case fullName = "full_name"
        case owner = "owner"
        case repositoryPrivate = "private"
        case htmlUrl = "html_url"
        case repositoryDescription = "description"
        case fork = "fork"
        case url = "url"
        case archiveUrl = "archive_url"
        case assigneesUrl = "assignees_url"
        case blobsUrl = "blobs_url"
        case branchesUrl = "branches_url"
        case collaboratorsUrl = "collaborators_url"
        case commentsUrl = "comments_url"
        case commitsUrl = "commits_url"
        case compareUrl = "compare_url"
        case contentsUrl = "contents_url"
        case contributorsUrl = "contributors_url"
        case deploymentsUrl = "deployments_url"
        case downloadsUrl = "downloads_url"
        case eventsUrl = "events_url"
        case forksUrl = "forks_url"
        case gitCommitsUrl = "git_commits_url"
        case gitRefsUrl = "git_refs_url"
        case gitTagsUrl = "git_tags_url"
        case gitUrl = "git_url"
        case issueCommentUrl = "issue_comment_url"
        case issueEventsUrl = "issue_events_url"
        case issuesUrl = "issues_url"
        case keysUrl = "keys_url"
        case labelsUrl = "labels_url"
        case languagesUrl = "languages_url"
        case mergesUrl = "merges_url"
        case milestonesUrl = "milestones_url"
        case notificationsUrl = "notifications_url"
        case pullsUrl = "pulls_url"
        case releasesUrl = "releases_url"
        case sshUrl = "ssh_url"
        case stargazersUrl = "stargazers_url"
        case statusesUrl = "statuses_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case tagsUrl = "tags_url"
        case teamsUrl = "teams_url"
        case treesUrl = "trees_url"
        case cloneUrl = "clone_url"
        case mirrorUrl = "mirror_url"
        case hooksUrl = "hooks_url"
        case svnUrl = "svn_url"
        case homepage = "homepage"
        case language = "language"
        case forksCount = "forks_count"
        case forks = "forks"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case watchers = "watchers"
        case size = "size"
        case defaultBranch = "default_branch"
        case openIssuesCount = "open_issues_count"
        case openIssues = "open_issues"
        case isTemplate = "is_template"
        case topics = "topics"
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDownloads = "has_downloads"
        case archived = "archived"
        case disabled = "disabled"
        case visibility = "visibility"
        case pushedAt = "pushed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case permissions = "permissions"
        case allowRebaseMerge = "allow_rebase_merge"
        case templateRepository = "template_repository"
        case tempCloneToken = "temp_clone_token"
        case allowSquashMerge = "allow_squash_merge"
        case allowAutoMerge = "allow_auto_merge"
        case deleteBranchOnMerge = "delete_branch_on_merge"
        case allowMergeCommit = "allow_merge_commit"
        case subscribersCount = "subscribers_count"
        case networkCount = "network_count"
        case license = "license"
        case organization = "organization"
        case parent = "parent"
        case source = "source"
    }
}

extension Repository {
    public struct License: Codable, Equatable {
        public var key: String
        public var name: String
        public var spdxId: String
        public var url: String
        public var nodeId: String
        public var htmlUrl: String?

        enum CodingKeys: String, CodingKey {
            case key = "key"
            case name = "name"
            case spdxId = "spdx_id"
            case url = "url"
            case nodeId = "node_id"
            case htmlUrl = "html_url"
        }

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
        }

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

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case nodeId = "node_id"
            case name = "name"
            case fullName = "full_name"
            case owner = "owner"
            case parentPrivate = "private"
            case htmlUrl = "html_url"
            case parentDescription = "description"
            case fork = "fork"
            case url = "url"
            case archiveUrl = "archive_url"
            case assigneesUrl = "assignees_url"
            case blobsUrl = "blobs_url"
            case branchesUrl = "branches_url"
            case collaboratorsUrl = "collaborators_url"
            case commentsUrl = "comments_url"
            case commitsUrl = "commits_url"
            case compareUrl = "compare_url"
            case contentsUrl = "contents_url"
            case contributorsUrl = "contributors_url"
            case deploymentsUrl = "deployments_url"
            case downloadsUrl = "downloads_url"
            case eventsUrl = "events_url"
            case forksUrl = "forks_url"
            case gitCommitsUrl = "git_commits_url"
            case gitRefsUrl = "git_refs_url"
            case gitTagsUrl = "git_tags_url"
            case gitUrl = "git_url"
            case issueCommentUrl = "issue_comment_url"
            case issueEventsUrl = "issue_events_url"
            case issuesUrl = "issues_url"
            case keysUrl = "keys_url"
            case labelsUrl = "labels_url"
            case languagesUrl = "languages_url"
            case mergesUrl = "merges_url"
            case milestonesUrl = "milestones_url"
            case notificationsUrl = "notifications_url"
            case pullsUrl = "pulls_url"
            case releasesUrl = "releases_url"
            case sshUrl = "ssh_url"
            case stargazersUrl = "stargazers_url"
            case statusesUrl = "statuses_url"
            case subscribersUrl = "subscribers_url"
            case subscriptionUrl = "subscription_url"
            case tagsUrl = "tags_url"
            case teamsUrl = "teams_url"
            case treesUrl = "trees_url"
            case cloneUrl = "clone_url"
            case mirrorUrl = "mirror_url"
            case hooksUrl = "hooks_url"
            case svnUrl = "svn_url"
            case homepage = "homepage"
            case language = "language"
            case forksCount = "forks_count"
            case stargazersCount = "stargazers_count"
            case watchersCount = "watchers_count"
            case size = "size"
            case defaultBranch = "default_branch"
            case openIssuesCount = "open_issues_count"
            case isTemplate = "is_template"
            case topics = "topics"
            case hasIssues = "has_issues"
            case hasProjects = "has_projects"
            case hasWiki = "has_wiki"
            case hasPages = "has_pages"
            case hasDownloads = "has_downloads"
            case archived = "archived"
            case disabled = "disabled"
            case visibility = "visibility"
            case pushedAt = "pushed_at"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case permissions = "permissions"
            case allowRebaseMerge = "allow_rebase_merge"
            case tempCloneToken = "temp_clone_token"
            case allowSquashMerge = "allow_squash_merge"
            case allowAutoMerge = "allow_auto_merge"
            case deleteBranchOnMerge = "delete_branch_on_merge"
            case allowMergeCommit = "allow_merge_commit"
            case subscribersCount = "subscribers_count"
            case networkCount = "network_count"
            case license = "license"
            case forks = "forks"
            case openIssues = "open_issues"
            case watchers = "watchers"
        }
    }

    public struct Permissions: Codable, Equatable {
        public var pull: Bool
        public var push: Bool
        public var admin: Bool

        enum CodingKeys: String, CodingKey {
            case pull = "pull"
            case push = "push"
            case admin = "admin"
        }

        public init(pull: Bool, push: Bool, admin: Bool) {
            self.pull = pull
            self.push = push
            self.admin = admin
        }
    }
}
