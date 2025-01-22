import SwiftUI

enum AppScreen: Hashable {
   case menu
    case shop
    case game
}

final class Router: ObservableObject {
    @Published var path: [AppScreen] = []
    
    func showMenu() {
        path.append(.menu)
    }
    
    func showShop() {
        path.append(.shop)
    }
    
    func showGame() {
        path.append(.game)
    }
    
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
