//
//  SearchTabView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 16/05/2023.
//

import SwiftUI

struct SearchTabView: View {
    
    @StateObject var searchVM = NewsAPISearchViewModel(service: NewsAPISearchServiceImpl())
    
    var body: some View {
        SearchView()
            .environmentObject(searchVM)
    }
}

struct NewsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
            .environmentObject(NewsAPISearchViewModel(service: NewsAPISearchServiceImpl()))
    }
}
