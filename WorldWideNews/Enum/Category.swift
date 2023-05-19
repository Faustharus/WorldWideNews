//
//  Category.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 14/05/2023.
//

import Foundation

enum Category: String, CaseIterable { // Add CodingKey ??
    case general
    case technology
    case entertainment
    case sports
    case health
    case science
    case business
    
    var categoryTitle: String {
        switch self {
            case .general:
                return "Gros Titres"
            case .technology:
                return "Technologie"
            case .entertainment:
                return "Divertissement"
            case .sports:
                return "Sports"
            case .health:
                return "Santé"
            case .science:
                return "Science"
            case .business:
                return "Affaires"
        }
    }
    
}

