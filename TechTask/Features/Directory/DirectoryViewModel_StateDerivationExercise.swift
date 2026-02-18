import Foundation
import Combine

/// EXERCISE (ViewModel-only)
///
/// Scenario:
/// - `allPeople` is loaded.
/// - `visiblePeople` should react to `query` and `sortOption`.
///
/// BUGS intentionally planted:
/// - visiblePeople is computed once and never updated.
/// - setPeople/setQuery/setSort forget to recompute.
///
/// FIXME:
/// - Recompute deterministically when inputs change.
/// - Keep sorting stable.
/// - (Optional) Debounce query.
/// - Add tests.
final class DirectoryStateDerivationExerciseViewModel: ObservableObject {
    @Published var allPeople: [Person] = []
    @Published var query: String = ""
    @Published var sortOption: SortOption = .name

    @Published private(set) var visiblePeople: [Person] = []

    init() {
        visiblePeople = allPeople
    }

    func setPeople(_ people: [Person]) {
        allPeople = people
    }

    func setQuery(_ q: String) {
        query = q
    }

    func setSort(_ option: SortOption) {
        sortOption = option
    }
}
