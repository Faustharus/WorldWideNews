//
//  NewsListView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 15/05/2023.
//

import SwiftUI

struct NewsListView: View {
    
    let articles: [Article]
    
    var body: some View {
        List {
            ForEach(articles, id: \.self) { item in
                ZStack(alignment: .leading) {
                    NewsRowView(article: item)
                    NavigationLink {
                        NewsDetailView(article: item)
                    } label: {
                        EmptyView()
                    }
                    .opacity(0.0)
                }
                .listRowSeparatorTint(.clear)
            }
        }
        .listStyle(.inset)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(articles: Article.dummyNews)
    }
}
