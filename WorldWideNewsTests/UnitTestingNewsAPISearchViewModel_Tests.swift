//
//  UnitTestingNewsAPISearchViewModel_Tests.swift
//  WorldWideNewsTests
//
//  Created by Damien Chailloleau on 18/05/2023.
//

import XCTest
@testable import WorldWideNews

final class UnitTestingNewsAPISearchViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func test_NewsAPISearchViewModel_articles_shouldBeEmpty() async {
        // Given
        let vm = NewsAPISearchViewModel(articles: [Article](), service: NewsAPISearchServiceImpl())
        let service = NewsAPISearchServiceImpl()
        
        // When
        do {
            let _ = try await service.fetchSearchedNews(from: "")
            vm.currentStatus = .empty
        } catch {
            print(error.localizedDescription)
        }
        
        
        // Then
        XCTAssertTrue(vm.articles.isEmpty)
        XCTAssertEqual(vm.articles.count, 0)
        
    }
    
    @MainActor func test_NewsAPISearchViewModel_articles_shouldNotBeEmpty() async {
        // Given
        let vm = NewsAPISearchViewModel(articles: [Article](), service: NewsAPISearchServiceImpl())
        let service = NewsAPISearchServiceImpl()
        let suggestions = ["Swift", "Elon Musk", "New York", "NASA"]
        let suggestion = suggestions.randomElement() ?? "Apple"
        
        // When
        do {
            let request = try await service.fetchSearchedNews(from: suggestion)
            vm.currentStatus = .successfull(request)
        } catch {
            print(error.localizedDescription)
        }
        
        // Then
        XCTAssertTrue(!vm.articles.isEmpty)
        XCTAssertFalse(vm.articles.isEmpty)
        XCTAssertNotEqual(vm.articles.count, 0)
        XCTAssertGreaterThan(vm.articles.count, 0)
    }

}
