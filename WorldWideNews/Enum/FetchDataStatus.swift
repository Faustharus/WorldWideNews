//
//  FetchDataStatus.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 16/05/2023.
//

import Foundation

enum FetchDataStatus<T: Any> {
    
    case empty
    case successfull(T)
    case failure(Error)
    
}
