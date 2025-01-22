import SwiftUI

struct BallMenuView: View {
    @StateObject var ballMenuModel =  BallMenuViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(.shadowBallMenu)
                    .resizable()
                    .frame(width: geometry.size.width * 0.554,
                           height: geometry.size.width * 0.554)
                    .position(x: geometry.size.width / 2.1, y: geometry.size.height / 4.5)
                
                ForEach(0..<2, id: \.self) { index in
                    Image(.fireMenu)
                        .resizable()
                        .frame(width: geometry.size.width * 1.02,
                               height: geometry.size.height * 0.408)
                        .position(x: geometry.size.width / 1.5,
                                  y: geometry.size.height / 6  + CGFloat(index * -80))
                }
                
                Image(.ballMenu)
                    .resizable()
                    .frame(width: geometry.size.width * 0.554,
                           height: geometry.size.width * 0.554)
                    .position(x: geometry.size.width / 2.45, y: geometry.size.height / 4)
                
                VStack(spacing: geometry.size.height * 0.045) {
                    Spacer()
                    
                    VStack(spacing: geometry.size.height * 0.025) {
                        BallWideButton(action: {
                            router.showGame()
                        }, text: "PLAY",
                                       geometry: geometry)
                        
                        BallWideButton(action: {
                            exit(0)
                        }, text: "QUIT",
                                       textSize: 46,
                                       imageWSize: 0.58,
                                       imageHSize: 0.13,
                                       geometry: geometry)
                    }
                    
                    HStack(spacing: 20) {
                        BallSquareButton(action: {
                            ballMenuModel.isSoundOff.toggle()
                        }, image: ballMenuModel.isSoundOff ? BallImageName.soundOffImage.rawValue : BallImageName.soundImage.rawValue,
                                         geometry: geometry)
                        
                        BallSquareButton(action: {
                            router.showShop()
                        }, image: BallImageName.shopImage.rawValue,
                                         backImageSize: 0.263, foregroundImageSize: 0.133,
                                         geometry: geometry)
                        
                        BallSquareButton(action: {
                            ballMenuModel.isMusicOff.toggle()
                        }, image: ballMenuModel.isMusicOff ? BallImageName.musicOffImage.rawValue : BallImageName.musicImage.rawValue,
                                         geometry: geometry)
                    }
                }
                .padding(.bottom, geometry.size.height * 0.09)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return BallMenuView(router: router)
}

