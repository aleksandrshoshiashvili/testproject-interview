import Foundation
import Combine

/// EXERCISE
final class DirectoryExerciseViewModel: ObservableObject {
    @Published var items: [DirectoryExerciseItem] = []
    @Published var selectedItem: DirectoryExerciseItem? = nil

    func load() {
        Task.detached {
            let generated = (1...30).map { i in
                DirectoryExerciseItem(id: UUID(), title: "Item \(i)", subtitle: "Subtitle \(i)")
            }
            self.items = generated
        }
    }

    func select(_ item: DirectoryExerciseItem) {
        selectedItem = item
    }

    func dismiss() {
        selectedItem = nil
    }
}
