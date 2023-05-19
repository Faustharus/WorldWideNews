//
//  AsyncImageView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import SwiftUI

struct AsyncImageView: View {
    
    let imageURL: URL?
    let width: CGFloat
    let height: CGFloat
    let paddingSize: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: imageURL) { img in
                img.resizable()
            } placeholder: {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.gray.opacity(0.6))
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                }
            }
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .padding(.leading, paddingSize)
            //.fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(width: 350)
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(imageURL: URL(string: "https://www.meilleure-innovation.com/wp-content/uploads/2023/03/starlink-reseau-telephone.png")!, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3, paddingSize: 20)
    }
}
