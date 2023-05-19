//
//  NewsAPIService.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import Foundation

protocol NewsAPIService {
    func generateURLNews(from category: Category, and language: Languages) -> URL
    func fetchArticles(from url: URL) async throws -> [Article]
    func fetchNews(from category: Category, and language: Languages) async throws -> [Article]
}

final class NewsAPIServiceImpl: ObservableObject, NewsAPIService {
    
    private let apiKey = NewsAPIKey.apiKey
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    init() {}
    
    func generateURLNews(from category: Category, and language: Languages) -> URL {
        let url = NewsAPIURL.newsAPIConstant
        let currentUrl = url.appending("language=\(language.rawValue)&category=\(category.rawValue)&apiKey=\(apiKey)")
        return URL(string: currentUrl)!
    }
    
    func fetchArticles(from url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        guard response is HTTPURLResponse else {
            throw NSError(domain: "NewsAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Bad URL Response"])
        }
        
        let newsFetched = try decoder.decode(APIResponse.self, from: data)
        return newsFetched.articles
    }
    
    func fetchNews(from category: Category, and language: Languages) async throws -> [Article] {
        try await fetchArticles(from: generateURLNews(from: category, and: language))
    }
    
}
