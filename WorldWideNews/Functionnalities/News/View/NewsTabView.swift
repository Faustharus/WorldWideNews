//
//  NewsTabView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 16/05/2023.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleVM = NewsAPIViewModel(service: NewsAPIServiceImpl())
    
    var body: some View {
        NewsArticleView()
            .environmentObject(articleVM)
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
            .environmentObject(NewsAPIViewModel(service: NewsAPIServiceImpl()))
    }
}
