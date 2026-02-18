import Foundation

struct Person: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let title: String
    let team: String
    let avatarURL: URL?
    let joinedAt: Date
}
