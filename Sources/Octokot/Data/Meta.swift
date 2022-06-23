import Foundation

public struct Meta: Codable, Equatable {
    public var verifiablePasswordAuthentication: Bool
    public var sshKeyFingerprints: [String: String]
    public var hooks: [String]
    public var web: [String]
    public var api: [String]
    public var git: [String]
    public var packages: [String]
    public var pages: [String]
    public var importer: [String]
    public var actions: [String]
    public var dependabot: [String]
}
