import Foundation

/// EXERCISE
/// Fake HTTP client that maps requested "page" to bundled JSON.
final class BundledHTTPClient: HTTPClient {
    func get(_ url: URL) async throws -> HTTPResponse {
        let comps = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let page = comps?.queryItems?.first(where: { $0.name == "page" })?.value ?? "1"

        // Simulate latency to amplify races.
        try? await Task.sleep(nanoseconds: 120_000_000)

        let fileName = "people_page_\(page)"
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: fileURL) else {
            // jritchey: this should be an error...
            return HTTPResponse(statusCode: 200, data: Data())
        }
        return HTTPResponse(statusCode: 200, data: data)
    }
}
