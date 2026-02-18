import Foundation

/// EXERCISE
protocol DirectoryInteractor {
    func loadFirstPage(query: String?) async throws -> DirectoryPage
    func loadNextPage(query: String?) async throws -> DirectoryPage
    func refresh(query: String?) async throws -> DirectoryPage
}
