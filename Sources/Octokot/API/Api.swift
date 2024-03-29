final class APIContext {
    let client: GHClient
    let configuration: GitHubAPI.Configuration

    init(client: GHClient, configuration: GitHubAPI.Configuration) {
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

    func execute(
        _ method: GHRequest.Method,
        _ path: String
    ) async throws -> GHResponse {
        var request = self.context.configuration.request
        request.method = method
        request.appendPath(path)
        return try await context.client.execute(request)
    }
}
