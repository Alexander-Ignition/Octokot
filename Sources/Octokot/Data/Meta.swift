import Foundation

public struct Meta: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case verifiablePasswordAuthentication = "verifiable_password_authentication"
        case sshKeyFingerprints = "ssh_key_fingerprints"
        case hooks
        case web
        case api
        case git
        case packages
        case pages
        case importer
        case actions
        case dependabot
    }

    public struct SSHKeyFingerprints: Codable, Equatable {
        public var SHA256_RSA: String
        public var SHA256_DSA: String
        public var SHA256_ECDSA: String
        public var SHA256_ED25519: String
    }

    public var verifiablePasswordAuthentication: Bool
    public var sshKeyFingerprints: SSHKeyFingerprints
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
