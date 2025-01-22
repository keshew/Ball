import SwiftUI

class BallShopViewModel: ObservableObject {
    let contact = BallShopModel()
    @Published var currentIndex = 0
    @Published var arrayOfBall = UserDefaultsManager().loadBalls()
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func lowerIndex() {
        currentIndex -= 1
    }
}
