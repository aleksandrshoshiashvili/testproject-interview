import Foundation

enum SortOption: String, CaseIterable, Identifiable {
    case name
    case team
    var id: String { rawValue }
}
