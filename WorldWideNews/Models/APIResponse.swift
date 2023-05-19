//
//  APIResponse.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 13/05/2023.
//

import Foundation

struct APIResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}
