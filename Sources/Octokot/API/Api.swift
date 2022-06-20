final class APIContext {
    let client: GHClient
    let configuration: GHConfiguration

    init(client: GHClient, configuration: GHConfiguration) {
        self.client = client
        self.configuration = configuration
    }
}

protocol API {
    var context: APIContext { get }
}

extension API {
    func execute(
        _ build: (inout GHRequest) throws -> Void
    ) async throws -> GHResponse {
        var request = self.context.configuration.request
        try build(&request)
        return try await context.client.execute(request)
    }
}
