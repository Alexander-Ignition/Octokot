protocol API {
    var configuration: GHConfiguration { get }
}

extension API {
    var client: GHClient { configuration.client }

    func execute(
        _ build: (inout GHRequest) throws -> Void
    ) async throws -> GHResponse {
        var request = self.configuration.request
        try build(&request)
        return try await client.execute(request)
    }
}
