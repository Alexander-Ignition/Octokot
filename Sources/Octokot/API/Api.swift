protocol API {
    var client: GHClient { get }
}

extension API {
    func execute(
        _ build: (inout GHRequest) throws -> Void
    ) async throws -> GHResponse {
        var request = self.client.configuration.request
        try build(&request)
        return try await client.execute(request)
    }
}
