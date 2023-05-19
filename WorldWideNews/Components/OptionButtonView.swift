//
//  OptionButtonView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import SwiftUI

struct OptionButtonView: View {
    
    let sfSymbols: String
    let rectangleCornerRadius: CGFloat
    let width: CGFloat
    let height: CGFloat
    let widthSymbols: CGFloat
    let heightSymbols: CGFloat
    
    init(sfSymbols: String, rectangleCornerRadius: CGFloat, width: CGFloat, height: CGFloat, widthSymbols: CGFloat, heightSymbols: CGFloat) {
        self.sfSymbols = sfSymbols
        self.rectangleCornerRadius = rectangleCornerRadius
        self.width = width
        self.height = height
        self.widthSymbols = widthSymbols
        self.heightSymbols = heightSymbols
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: rectangleCornerRadius)
                .fill(.black.shadow(.drop(color: .black, radius: 3, x: 2, y: 2)))
                .frame(width: width, height: height)
            VStack {
                HStack {
                    Text("Vers l'article")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                    Image(systemName: sfSymbols)
                        .resizable()
                        .imageScale(.large)
                        .frame(width: widthSymbols, height: heightSymbols)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 15)
            }
        }
    }
}

struct OptionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtonView(sfSymbols: "bookmark", rectangleCornerRadius: 50, width: 100, height: 55, widthSymbols: 22, heightSymbols: 30)
    }
}
