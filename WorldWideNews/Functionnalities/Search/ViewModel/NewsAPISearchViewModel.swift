//
//  NewsAPISearchViewModel.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 16/05/2023.
//

import SwiftUI

@MainActor
final class NewsAPISearchViewModel: ObservableObject {
    
    //@Published private(set) var articles = [Article]()
    @Published var currentStatus = FetchDataStatus<[Article]>.empty
    @Published var searchText: String = ""
    
    private let service: NewsAPISearchService
    
    init(articles: [Article]? = nil, service: NewsAPISearchService) {
        if let articles = articles {
            self.currentStatus = .successfull(articles)
        } else {
            self.currentStatus = .empty
        }
        self.service = service
    }
    
    func fetchSearchedNews() async {
        if Task.isCancelled { return }
        currentStatus = .empty
        
        let searchQuery = self.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let queryName = searchQuery.replacingOccurrences(of: " ", with: "+")
        
        if queryName.isEmpty { return }
        
        do {
            let articles = try await service.fetchSearchedNews(from: queryName)
            if Task.isCancelled { return }
            currentStatus = .successfull(articles)
        } catch {
            currentStatus = .failure(error)
        }
    }
    
    var articles: [Article] {
        if case let .successfull(articles) = currentStatus {
            return articles
        } else {
            return []
        }
    }
    
}
