import Foundation

struct DirectoryPage: Codable, Equatable {
    let people: [Person]
    let nextPage: Int?
}

protocol DirectoryAPI {
    func fetchPeople(page: Int, query: String?) async throws -> DirectoryPage
}

/// EXERCISE
final class BundledDirectoryAPI: DirectoryAPI {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchPeople(page: Int, query: String?) async throws -> DirectoryPage {
        let url = URL(string: "https://example.com?page=\(page)")! // force unwrap, generally bad idea.
        let response = try await client.get(url)
        
        let decoder = JSONDecoder()
        return try decoder.decode(DirectoryPage.self, from: response.data)
    }
}
