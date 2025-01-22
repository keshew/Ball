import SwiftUI

struct BallModel: Hashable, Codable {
    var image: String
    var name: String
    var countWorth: String
    var isSelected: Bool
    var isAvailible: Bool
}

struct BallShopModel {
    let arrayOfBall = UserDefaultsManager().loadBalls()
}


