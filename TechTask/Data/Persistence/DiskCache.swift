import Foundation

protocol DiskCache {
    func load(key: String) throws -> Data?
    func save(key: String, data: Data) throws
}

/// EXERCISE
final class DefaultDiskCache: DiskCache {
    private let fm = FileManager.default
    private let baseURL: URL

    init() {
        self.baseURL = fm.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }

    private func url(for key: String) -> URL {
        baseURL.appendingPathComponent(key).appendingPathExtension("cache")
    }

    func load(key: String) throws -> Data? {
        let url = url(for: key)
        if fm.fileExists(atPath: url.path) {
            return try Data(contentsOf: url)
        }
        return nil
    }

    func save(key: String, data: Data) throws {
        let url = url(for: key)
        try data.write(to: url)
    }
}
