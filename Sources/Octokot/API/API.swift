protocol API {
    var configuration: GHConfiguration { get }
}

extension API {
    func execute(
        _ build: (inout GHRequest) throws -> Void
    ) async throws -> GHResponse {
        var request = self.configuration.request
        try build(&request)
        return try await configuration.client.execute(request)
    }
}
