import SwiftUI

@main
struct class_task_m1w4d1App: App {
    @StateObject private var tokenManager = TokenManager()

    init() {
        fetchDynamicToken()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    private func fetchDynamicToken() {
        TokenManager.shared.fetchToken { token in
            if let token = token {
                KeychainHelper.shared.saveToken(token)
                print("Token saved successfully.")
            } else {
                print("Failed to fetch token.")
            }
        }
    }
}
