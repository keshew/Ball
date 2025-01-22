import SwiftUI

struct BallGoPlayView: View {
    @StateObject var BallGoPlayModel =  BallGoPlayViewModel()
    @ObservedObject var router: Router
    @Binding var showGoToPlay: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Image(.squareButtonBackground)
                            .resizable()
                            .frame(width: 350, height: 150)
                        
                        Text("LETS TRY THIS BALL?")
                            .BigshotOne(size: 26)
                            .offset(y: -10)
                        
                        HStack {
                            Button(action: {
                                router.showGame()
                            }) {
                                ZStack {
                                    Image(.wideButtonBackground)
                                        .resizable()
                                        .frame(width: 150, height: 70)
                                    
                                    Text("LET'S GO!")
                                        .BigshotOne(size: 20)
                                }
                            }
                            
                            Button(action: {
                                router.showShop()
                            }) {
                                ZStack {
                                    Image(.wideButtonBackground)
                                        .resizable()
                                        .frame(width: 150, height: 70)
                                    
                                    Text("STAY HERE")
                                        .BigshotOne(size: 20)
                                }
                            }
                        }
                        .offset(y: 60)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var showGoTo = true
    @ObservedObject var router = Router()
    return BallGoPlayView(router: router, showGoToPlay: $showGoTo)
}

