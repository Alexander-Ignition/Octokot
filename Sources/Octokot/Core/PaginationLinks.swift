import Foundation

public struct PaginationLinks: Equatable {
    public var next: URL?
    public var last: URL?
    public var first: URL?
    public var prev: URL?
}

extension PaginationLinks {
    private static let regexp: NSRegularExpression? = {
        do {
            let pattern = #"<(?<link>\S+)\>;\s+rel="(?<rel>next|last|first|prev)""#
            return try NSRegularExpression(pattern: pattern)
        } catch {
            assertionFailure("\(error)")
            return nil
        }
    }()

    init(string: String) {
        let text = string as NSString
        let range = NSRange(location: 0, length: text.length)
        let matches = PaginationLinks.regexp?.matches(in: string, range: range) ?? []

        for match in matches {
            let rel = text.substring(with: match.range(withName: "rel"))
            let link = text.substring(with: match.range(withName: "link"))
            let url = URL(string: link)

            switch rel {
            case "next":
                self.next = url
            case "last":
                self.last = url
            case "first":
                self.first = url
            case "prev":
                self.prev = url
            default:
                assertionFailure("Unknown rel: \(String(reflecting: rel))")
            }
        }
    }
}
