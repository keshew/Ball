import SwiftUI

class BallLoadingViewModel: ObservableObject {
    let contact = BallLoadingModel()
    @Published var currentIndex = 0 
}
