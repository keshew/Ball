import SwiftUI

extension Text {
    func BigshotOne(size: CGFloat,
                    color: Color = .white,
                    outlineWidth: CGFloat = 0.8,
                    colorOutline: Color = .black) -> some View {
        self.font(.custom("BigshotOne-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}

