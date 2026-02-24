import Foundation

/// EXERCISE
final class URLSessionHTTPClient: HTTPClient {
    func get(_ url: URL) async throws -> HTTPResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        let status = (response as? HTTPURLResponse)?.statusCode ?? 200 // jritchey: defaults to 200, if problem w/ statusCode
        return HTTPResponse(statusCode: status, data: data)
    }
}
