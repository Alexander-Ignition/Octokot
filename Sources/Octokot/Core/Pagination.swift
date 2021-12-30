import Foundation

public struct Pagination<Item>: Api where Item: Decodable {
    public let items: [Item]
    public let links: PaginationLinks?
    let client: GHClient
}

// MARK: - Pagination + Links

extension Pagination {

    public var next: Pagination<Item>? {
        get async throws {
            try await pagination(url: links?.next)
        }
    }

    public var previous: Pagination<Item>? {
        get async throws {
            try await pagination(url: links?.prev)
        }
    }

    public var first: Pagination<Item>? {
        get async throws {
            try await pagination(url: links?.first)
        }
    }

    public var last: Pagination<Item>? {
        get async throws {
            try await pagination(url: links?.last)
        }
    }

    private func pagination<T>(
        url: URL?
    ) async throws -> Pagination<T>? where T: Decodable {
        guard let url = url else {
            return nil
        }
        return try await pagination {
            $0.url = url
        }
    }
}

// MARK: - Api + Pagination

extension Api {
    func pagination<T>(
        _ build: (inout GHRequest) throws -> Void
    ) async throws -> Pagination<T> where T: Decodable {
        let response = try await execute(build)
        let items = try response.decode([T].self)
        let links = response.headers["Link"].map { PaginationLinks(string: $0) }
        return Pagination(items: items, links: links, client: client)
    }
}
