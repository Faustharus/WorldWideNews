//
//  SearchView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var searchVM: NewsAPISearchViewModel
    
    var body: some View {
        NavigationStack {
            NewsListView(articles: searchVM.articles)
                .overlay(overlayIdleSearch)
                .navigationTitle("Search")
                .searchable(text: $searchVM.searchText)
                .onSubmit(of: .search) {
                    Task {
                        await searchVM.fetchSearchedNews()
                    }
                }
                .onChange(of: searchVM.searchText) { newValue in
                    if newValue.isEmpty {
                        searchVM.currentStatus = .empty
                    }
                }
                .refreshable {
                    Task {
                        await searchVM.fetchSearchedNews()
                    }
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(NewsAPISearchViewModel(service: NewsAPISearchServiceImpl()))
    }
}


extension SearchView {
    
    @ViewBuilder
    private var overlayIdleSearch: some View {
        switch searchVM.currentStatus {
            case .empty:
                if !searchVM.searchText.isEmpty {
                    ProgressView()
                } else {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Spacer().frame(height: 20)
                        
                        Text("Écrivez dans la barre ce que vous souhaitez voir \nEx: \n- Elon Musk \n- New York \n- Ukraine \netc...")
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(.white)
                }
            case .successfull(let articles) where articles.isEmpty:
                Text("Success")
            case .failure(let error):
                Text("Failure: \(error.localizedDescription)")
            default: EmptyView()
        }
    }
    
}
