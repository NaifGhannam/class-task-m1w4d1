import Foundation
import KeychainSwift

class KeychainHelper {
    static let shared = KeychainHelper()
    private let keychain = KeychainSwift()

    private let tokenKey = "5ef4170b3ef345949f2a8a78e9c270ed"

    private init() {}

    func saveToken(_ token: String) {
        keychain.set(token, forKey: tokenKey)
    }

    func getToken() -> String? {
        return keychain.get(tokenKey)
    }

    func clearToken() {
        keychain.delete(tokenKey)
    }
}
