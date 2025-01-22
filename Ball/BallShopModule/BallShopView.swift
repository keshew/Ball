import SwiftUI

struct BallShopView: View {
    @StateObject var ballShopModel =  BallShopViewModel()
    @ObservedObject var router: Router
    @State var showGoToPlay = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                if showGoToPlay {
                    BallGoPlayView(router: router, showGoToPlay: $showGoToPlay)
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                        .zIndex(1)
                }
                
                VStack {
                    HStack(spacing: geometry.size.width * 0.04) {
                        Text("\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)")
                            .BigshotOne(size: 52, outlineWidth: 0.5)
                        
                        Image(.coin)
                            .resizable()
                            .frame(width: geometry.size.width * 0.175,
                                   height: geometry.size.width * 0.175)
                    }
                    .offset(y: -geometry.size.height * 0.04)
                    
                    ZStack {
                        Image(.squareButtonBackground)
                            .resizable()
                            .frame(width: geometry.size.width * 0.938,
                                   height: geometry.size.width * 0.938)
                        
                        ZStack {
                            Image(.wideButtonBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.53,
                                       height: geometry.size.height * 0.136)
                            
                            Text("SHOP")
                                .BigshotOne(size: 46, outlineWidth: 0.5)
                        }
                        .offset(y: -geometry.size.height * 0.211)
                        
                        Text(ballShopModel.arrayOfBall?[ballShopModel.currentIndex].name ?? "")
                            .BigshotOne(size: 34, outlineWidth: 0.5)
                            .offset(y: -geometry.size.height * 0.113)
                        
                        Image(ballShopModel.arrayOfBall?[ballShopModel.currentIndex].image ?? "")
                            .resizable()
                            .frame(width: geometry.size.width * 0.255, height: geometry.size.width * 0.255)
                            .offset(y: -5)
                        
                        Button(action: {
                            UIView.setAnimationsEnabled(false)
                            UserDefaultsManager().manageBall(at: ballShopModel.currentIndex)
                            showGoToPlay = true
                        }) {
                            ZStack {
                                Image(.wideButtonBackground)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.352,
                                           height: geometry.size.height * 0.078)
                                
                                HStack {
                                    if ballShopModel.arrayOfBall?[ballShopModel.currentIndex].isAvailible ?? false {
                                        Text("SELECT")
                                            .BigshotOne(size: 22, outlineWidth: 0.5)
                                    } else if  ballShopModel.arrayOfBall?[ballShopModel.currentIndex].isSelected ?? false {
                                        Text("SELECTED")
                                            .BigshotOne(size: 22, outlineWidth: 0.5)
                                    } else {
                                        Text("75")
                                            .BigshotOne(size: 22, outlineWidth: 0.5)
                                        
                                        Image(.coin)
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                    }
                                }
                            }
                        }
                        .disabled(
                            !ballShopModel.arrayOfBall![ballShopModel.currentIndex].isAvailible &&
                            ballShopModel.arrayOfBall![ballShopModel.currentIndex].isSelected == false &&
                            UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue) < 75 || ballShopModel.arrayOfBall![ballShopModel.currentIndex].isSelected == true
                        )
                        .offset(y: geometry.size.height * 0.106)
                        
                        
                        HStack(spacing: geometry.size.width * 0.08) {
                            Button(action: {
                                ballShopModel.lowerIndex()
                            }) {
                                ZStack {
                                    Image(.wideButtonBackground)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.352,
                                               height: geometry.size.height * 0.119)
                                    
                                    Image(.backArrow)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.14,
                                               height: geometry.size.width * 0.14)
                                        .opacity(ballShopModel.currentIndex == 0 ? 0.5 : 1)
                                }
                            }
                            .disabled(ballShopModel.currentIndex == 0 ? true : false)
                            
                            
                            Button(action: {
                                ballShopModel.increaseIndex()
                            }) {
                                ZStack {
                                    Image(.wideButtonBackground)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.352,
                                               height: geometry.size.height * 0.119)
                                    
                                    Image(.nextArrow)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.14,
                                               height: geometry.size.width * 0.14)
                                        .opacity(ballShopModel.currentIndex == 3 ? 0.5 : 1)
                                }
                            }
                            .disabled(ballShopModel.currentIndex == 3 ? true : false)
                        }
                        .offset(y: geometry.size.height * 0.215)
                    }
                    
                    Button(action: {
                        router.showMenu()
                    }) {
                        ZStack {
                            Image(.squareButtonBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.257,
                                       height: geometry.size.width * 0.257)
                            
                            Image(.home)
                                .resizable()
                                .frame(width: geometry.size.width * 0.12,
                                       height: geometry.size.width * 0.12)
                        }
                    }
                    .offset(y: geometry.size.height * 0.07)
                }
                
                Image(.candyBackground)
                    .resizable()
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return BallShopView(router: router)
}

