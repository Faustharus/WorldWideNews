//
//  NewsAPIViewModel.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import SwiftUI

@MainActor
final class NewsAPIViewModel: ObservableObject {
    
    //@Published private(set) var articles = [Article]()
    @Published var currentStatus = FetchDataStatus<[Article]>.empty
    @Published var selectedCategory: Category
    @Published var selectedLanguages: Languages
    
    private let service: NewsAPIService
    
    init(articles: [Article]? = nil, service: NewsAPIService, selectedCategory: Category = .general, selectedLanguages: Languages = .fr) {
        if let articles = articles {
            self.currentStatus = .successfull(articles)
        } else {
            self.currentStatus = .empty
        }
        self.service = service
        self.selectedCategory = selectedCategory
        self.selectedLanguages = selectedLanguages
    }
    
    func fetchAllNews() async {
        currentStatus = .empty
        do {
            let articles = try await service.fetchNews(from: selectedCategory, and: selectedLanguages)
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
