import Foundation

struct DIContainer {
    let api: DirectoryAPI
    let favorites: FavoritesStore
    let disk: DiskCache

    init() {
        let http = BundledHTTPClient()
        self.api = BundledDirectoryAPI(client: http)
        self.favorites = InMemoryFavoritesStore()
        self.disk = DefaultDiskCache()
    }
}
