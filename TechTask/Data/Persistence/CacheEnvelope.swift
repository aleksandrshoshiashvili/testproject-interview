import Foundation

struct CacheEnvelope: Codable, Equatable {
    let savedAt: Date
    let payload: Data
}
