//
//  NewsAPISearchService.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 16/05/2023.
//

import Foundation

protocol NewsAPISearchService {
    func generateURLSearchNews(from query: String) -> URL
    func fetchArticles(from url: URL) async throws -> [Article]
    func fetchSearchedNews(from query: String) async throws -> [Article]
}

final class NewsAPISearchServiceImpl: ObservableObject, NewsAPISearchService {
    
    private let apiKey = NewsAPIKey.apiKey
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    init() {}
    
    func generateURLSearchNews(from query: String) -> URL {
        let url = NewsAPIURL.newsAPIConstantEverything
        let encodedRequest = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let currentUrl = url.appending("q=\(encodedRequest)&apiKey=\(apiKey)")
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
    
    func fetchSearchedNews(from query: String) async throws -> [Article] {
        try await fetchArticles(from: generateURLSearchNews(from: query))
    }
    
}
