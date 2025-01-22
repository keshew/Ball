import SwiftUI
import SpriteKit

struct BallGameView: View {
    @StateObject var ballGameModel =  BallGameViewModel()
    @StateObject var gameModel =  BallGameData()
    @ObservedObject var router: Router
    
    var body: some View {
        SpriteView(scene: ballGameModel.createBallGameScene(gameData: gameModel))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $gameModel.isMenu) {
                BallMenuView(router: router)
            }
            .navigationDestination(isPresented: $gameModel.isRestart) {
                BallGameView(router: router)
            }
    }
}

#Preview {
    @ObservedObject var router = Router()
    return BallGameView(router: router)
}


