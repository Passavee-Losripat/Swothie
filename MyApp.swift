import SwiftUI

@main
struct MyApp: App {
    init() {
        BackgroundMusicManager.shared.playMusic(musicNumber: 1)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
