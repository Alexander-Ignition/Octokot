public struct GHError: Error, Codable {
    enum CodingKeys: String, CodingKey {
        case message
        case documentationUrl = "documentation_url"
    }

    static func http(status: Int) -> GHError {
        GHError(
            message: "HTTP status code \(status)",
            documentationUrl: nil)
    }

    public let message: String
    public let documentationUrl: String?
}
