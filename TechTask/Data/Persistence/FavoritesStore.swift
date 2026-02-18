import Foundation

protocol FavoritesStore {
    func isFavorite(id: String) -> Bool
    func toggle(id: String)
    var allFavorites: Set<String> { get }
}

/// EXERCISE
final class InMemoryFavoritesStore: FavoritesStore {
    private(set) var favorites: Set<String> = []

    var allFavorites: Set<String> { favorites }

    func isFavorite(id: String) -> Bool {
        favorites.contains(id)
    }

    func toggle(id: String) {
        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
    }
}
