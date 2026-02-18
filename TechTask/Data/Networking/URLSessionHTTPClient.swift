import Foundation

/// EXERCISE
final class URLSessionHTTPClient: HTTPClient {
    func get(_ url: URL) async throws -> HTTPResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        let status = (response as? HTTPURLResponse)?.statusCode ?? 200
        return HTTPResponse(statusCode: status, data: data)
    }
}
