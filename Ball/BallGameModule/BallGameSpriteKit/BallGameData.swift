import SwiftUI

class BallGameData: ObservableObject {
    @Published var isPause = false
    @Published var isMenu = false
    @Published var isRestart = false
    @Published var currentScore = 0
    @Published var timeWent = 0
}
