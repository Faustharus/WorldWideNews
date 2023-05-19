//
//  NewsDetailView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 13/05/2023.
//

import SwiftUI

struct NewsDetailView: View {
    
    let article: Article
    @Environment(\.openURL) var openURL
    
    @State private var selectedArticle: Article?
    
    @State private var seeArticle: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            
            VStack {
                AsyncImageView(imageURL: article.imageURL, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.45, paddingSize: UIScreen.main.bounds.width * 0.0)
                    .padding(.horizontal, 20)
            }
            
            Spacer().frame(height: 10)
            
            LazyVStack(spacing: 20) {
                
                TextArticleView(titleText: article.title, descriptionText: article.descriptionText)
                
                HStack {
                    
                    Button {
                        self.seeArticle = true
                    } label: {
                        OptionButtonView(sfSymbols: "newspaper", rectangleCornerRadius: 50, width: 180, height: 55, widthSymbols: 20, heightSymbols: 20)
                    }
                    
                }
            }
        }
        .navigationTitle("\(article.authorName) - \(article.releaseDate)").font(.caption)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedArticle) {
            SafariView(url: $0.articleURL)
                .edgesIgnoringSafeArea(.bottom)
        }
        .alert(isPresented: $seeArticle) {
            Alert(title: Text("Voulez-vous voir l'article ?"), message: Text("\(article.articleURL)"), primaryButton: .default(Text("Accepter"), action: {
                selectedArticle = article
            }), secondaryButton: .cancel(Text("Annuler"), action: {
                self.seeArticle = false
            }))
        }
        
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewsDetailView(article: .dummyNews[0])
        }
    }
}
