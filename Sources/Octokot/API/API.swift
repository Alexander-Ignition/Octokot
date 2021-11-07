protocol API {
    var configuration: GHConfiguration { get }

    init(configuration: GHConfiguration)
}

extension API {
    @inlinable
    func api<T>(path: String = #function) -> T where T: API {
        var configuration = self.configuration
        configuration.request.url.appendPathComponent(path)
        return T.init(configuration: configuration)
    }

    func execute(
        _ build: (inout GHRequest) throws -> Void
    ) async throws -> GHResponse {
        var request = self.configuration.request
        try build(&request)
        return try await configuration.client.execute(request)
    }
}
