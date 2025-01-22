import SwiftUI

class BallGameViewModel: ObservableObject {
    let contact = BallGameModel()

    func createBallGameScene(gameData: BallGameData) -> BallGameSpriteKit {
        let scene = BallGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
