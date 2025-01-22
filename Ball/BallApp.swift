import SwiftUI

@main
struct BallApp: App {
    var body: some Scene {
        WindowGroup {
            BallLoadingView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
