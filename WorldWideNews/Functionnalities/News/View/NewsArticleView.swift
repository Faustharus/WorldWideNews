//
//  NewsArticleView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import SwiftUI

struct NewsArticleView: View {
    
    @EnvironmentObject var articleVM: NewsAPIViewModel
    
    var body: some View {
        NavigationStack {
            NewsListView(articles: articleVM.articles)
                .navigationTitle(articleVM.selectedCategory.categoryTitle)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        categoryMenuChoice
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        languageMenuChoice
                    }
                }
                .onAppear {
                    loadNews()
                }
                .onChange(of: articleVM.selectedCategory) { _ in
                    loadNews()
                }
                .onChange(of: articleVM.selectedLanguages) { _ in
                    loadNews()
                }
                .refreshable {
                    loadNews()
                }
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView()
            .environmentObject(NewsAPIViewModel(service: NewsAPIServiceImpl()))
    }
}

// MARK: - Func & Computed Properties
extension NewsArticleView {
    
    private func loadNews() {
        Task {
            await articleVM.fetchAllNews()
        }
    }
    
}


// MARK: - Internal View Components
extension NewsArticleView {
    
    var categoryMenuChoice: some View {
        Menu {
            Picker("", selection: $articleVM.selectedCategory) {
                ForEach(Category.allCases, id: \.self) { name in
                    Text(name.categoryTitle)
                        .tag(name)
                }
            }
        } label: {
            Image(systemName: "list.bullet")
        }
    }
    
    var languageMenuChoice: some View {
        Menu {
            Picker("", selection: $articleVM.selectedLanguages) {
                ForEach(Languages.allCases, id: \.self) { lng in
                    Text(lng.langIcon)
                        .tag(lng)
                }
            }
        } label: {
            Image(systemName: "flag.fill")
        }
    }
    
}
