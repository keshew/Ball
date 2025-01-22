import SwiftUI

class BallMenuViewModel: ObservableObject {
    let contact = BallMenuModel()
    @Published var isSoundOff = false
    @Published var isMusicOff = false 
}
