import Foundation
import Combine

/// EXERCISE
final class DirectoryExerciseViewModel: ObservableObject {
    @Published var items: [DirectoryExerciseItem] = []
    @Published var selectedItem: DirectoryExerciseItem? = nil

    func load() {
        // unstructured concurrency... better to make "func load() async" and use await.
        Task.detached {
            let generated = (1...30).map { i in
                DirectoryExerciseItem(id: UUID(), title: "Item \(i)", subtitle: "Subtitle \(i)")
            }
            self.items = generated // refactor to avoid self.item mutation from nonisolated context
        }
    }

    func select(_ item: DirectoryExerciseItem) {
        selectedItem = item
    }

    func dismiss() {
        selectedItem = nil
    }
}
