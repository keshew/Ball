import SwiftUI

struct BallLoadingView: View {
    @StateObject var ballLoadingModel =  BallLoadingViewModel()
    @ObservedObject var router = Router()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $router.path) {
                ZStack {
                    Image(ballLoadingModel.contact.arrayOfScreenBackground[ballLoadingModel.currentIndex])
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        Image(ballLoadingModel.contact.arrayOfLoadingLine[ballLoadingModel.currentIndex])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 316, height: 18)
                            .padding(.bottom, 95)
                    }
                }
                .navigationDestination(for: AppScreen.self) { screen in
                    switch screen {
                    case .menu:
                        BallMenuView(router: router)
                    case .shop:
                        BallShopView(router: router)
                    case .game:
                        BallGameView(router: router)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                ballLoadingModel.currentIndex += 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                router.showMenu()
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BallLoadingView()
}

