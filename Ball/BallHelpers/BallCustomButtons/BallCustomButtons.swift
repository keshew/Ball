import SwiftUI

struct BallWideButton: View {
    var action: (() -> ())
    var text: String
    var textSize: CGFloat = 52
    var imageWSize: CGFloat = 0.755
    var imageHSize: CGFloat = 0.17
    var geometry: GeometryProxy
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.wideButtonBackground)
                    .resizable()
                    .frame(width: geometry.size.width * imageWSize,
                           height: geometry.size.height * imageHSize)
                
                Text(text)
                    .BigshotOne(size: textSize)
            }
        }
    }
}

struct BallSquareButton: View {
    var action: (() -> ())
    var image: String
    var backImageSize: CGFloat = 0.186
    var foregroundImageSize: CGFloat = 0.087
    var geometry: GeometryProxy
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.squareButtonBackground)
                    .resizable()
                    .frame(width: geometry.size.width * backImageSize, height: geometry.size.width * backImageSize)
                
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * foregroundImageSize, height: geometry.size.width * foregroundImageSize)
                    .offset(y: 2)
            }
        }
    }
}


