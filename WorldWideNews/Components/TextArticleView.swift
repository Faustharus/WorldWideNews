//
//  TextArticleView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import SwiftUI

struct TextArticleView: View {
    
    let titleText: String
    let descriptionText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.system(size: 24, weight: .bold, design: .default))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 7)
            
            Spacer().frame(height: 10)
            
            Text(descriptionText)
                .font(.system(size: 16, weight: .light, design: .default))
                .lineLimit(4)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 10)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct TextArticleView_Previews: PreviewProvider {
    static var previews: some View {
        TextArticleView(titleText: "Internet par satellite : comment Elon Musk et Starlink révolutionne le monde des télécoms", descriptionText: "Au milieu des différentes annonces d’Elon Musk – offre payante pour Twitter et les baisses de prix des voitures Tesla – le multimilliardaire s’occupe d’un autre grand projet : offrir un réseau mobile mondial directement connecté à sa flotte de satellites en o…")
    }
}
