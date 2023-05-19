//
//  UnitTestingNewsAPIViewModel_Tests.swift
//  WorldWideNewsTests
//
//  Created by Damien Chailloleau on 17/05/2023.
//

import XCTest
@testable import WorldWideNews

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then

final class UnitTestingNewsAPIViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func test_NewsAPIViewModel_selectedCategory_shouldBeInjectedValue() {
        // Given
        let shouldBeStartAtDotGeneral = NewsAPIViewModel(articles: [Article](), service: NewsAPIServiceImpl(), selectedCategory: Category.general, selectedLanguages: Languages.fr)
        
        // When
        let articleCategory = shouldBeStartAtDotGeneral.selectedCategory
        let selectedCategory = articleCategory.rawValue
        
        // Then
        XCTAssertEqual(shouldBeStartAtDotGeneral.selectedCategory.rawValue, selectedCategory)
        
    }
    
    @MainActor func test_NewsAPIViewModel_articles_shouldBeEmpty() {
        // Given
        let vm = NewsAPIViewModel(articles: [Article](), service: NewsAPIServiceImpl(), selectedCategory: Category.general, selectedLanguages: Languages.fr)
        
        // When
        vm.currentStatus = .empty
        
        // Then
        XCTAssertTrue(vm.articles.isEmpty)
        XCTAssertEqual(vm.articles.count, 0)
        
    }
    
    @MainActor func test_NewsAPIViewModel_articles_shouldNotBeEmpty() async {
        // Given
        let vm = NewsAPIViewModel(articles: [Article](), service: NewsAPIServiceImpl(), selectedCategory: Category.general, selectedLanguages: Languages.fr)
        
        // When
        do {
            await vm.fetchAllNews()
            vm.currentStatus = .successfull(vm.articles)
        }
        
        // Then
        XCTAssertTrue(!vm.articles.isEmpty)
        XCTAssertFalse(vm.articles.isEmpty)
        XCTAssertNotEqual(vm.articles.count, 0)
        XCTAssertGreaterThan(vm.articles.count, 0)
    }

}
