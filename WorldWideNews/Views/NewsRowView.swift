//
//  NewsRowView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 13/05/2023.
//

import SwiftUI

struct NewsRowView: View {
    
    let article: Article
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            
            AsyncImageView(imageURL: article.imageURL, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3, paddingSize: UIScreen.main.bounds.width * 0.00)
            
            Spacer().frame(height: 25)
            
            LazyVStack {
                TextArticleView(titleText: article.title, descriptionText: article.descriptionText)
                
                Spacer().frame(height: 20)
                
                Text("By \(article.authorName) - \(article.releaseDate) ")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding([.horizontal, .vertical], 20)
            
            Divider()
        }
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(article: Article.dummyNews[1])
    }
}
