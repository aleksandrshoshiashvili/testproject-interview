import Foundation

struct HTTPResponse {
    let statusCode: Int
    let data: Data
}

protocol HTTPClient {
    func get(_ url: URL) async throws -> HTTPResponse
}

enum HTTPError: Error, Equatable {
    case invalidStatus(Int)
    case transport
}
