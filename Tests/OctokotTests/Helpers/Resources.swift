import Foundation

struct Resources {
    static let shared = Resources(bundle: .module)

    let bundle: Bundle

    func data(_ path: String) throws -> Data {
        try Data(contentsOf: url(path))
    }

    func url(_ path: String) throws -> URL {
        guard let url = bundle.url(forResource: path, withExtension: nil) else {
            throw URLError(.badURL, userInfo: [
                NSLocalizedDescriptionKey: "Resource not found",
                NSFilePathErrorKey: path
            ])
        }
        return url
    }
}
