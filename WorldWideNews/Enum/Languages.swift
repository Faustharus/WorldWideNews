//
//  Languages.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 15/05/2023.
//

import Foundation

enum Languages: String, CaseIterable {
    case fr
    case en
    
    var langIcon: String {
        switch self {
            case .fr:
                return "Français 🇫🇷"
            case .en:
                return "English 🇬🇧"
        }
    }
}

