import Foundation

/// EXERCISE
final class DirectoryInteractorImpl: DirectoryInteractor {
    private let api: DirectoryAPI
    private let disk: DiskCache
    private let clock: Clock

    private var nextPage: Int? = 1

    private let cacheKey = "directory_page_1"
    private let ttlSeconds: TimeInterval = 60

    init(api: DirectoryAPI, disk: DiskCache, clock: Clock = SystemClock()) {
        self.api = api
        self.disk = disk
        self.clock = clock
    }

    func loadFirstPage(query: String?) async throws -> DirectoryPage {
        nextPage = 1

        if let cached = try disk.load(key: cacheKey),
           let env = try? JSONDecoder().decode(CacheEnvelope.self, from: cached),
           clock.now.timeIntervalSince(env.savedAt) > ttlSeconds { // BUG: inverted
            return try JSONDecoder().decode(DirectoryPage.self, from: env.payload)
        }

        let page = try await api.fetchPeople(page: 1, query: query)

        let env = CacheEnvelope(savedAt: clock.now, payload: try JSONEncoder().encode(page))
        try disk.save(key: cacheKey, data: try JSONEncoder().encode(env))

        nextPage = page.nextPage
        return page
    }

    func loadNextPage(query: String?) async throws -> DirectoryPage {
        guard let p = nextPage else { return DirectoryPage(people: [], nextPage: nil) }
        let page = try await api.fetchPeople(page: p, query: query)
        nextPage = page.nextPage
        return page
    }

    func refresh(query: String?) async throws -> DirectoryPage {
        return try await loadFirstPage(query: query)
    }
}
