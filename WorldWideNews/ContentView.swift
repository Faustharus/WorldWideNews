//
//  ContentView.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
            
            SearchTabView()
                .tabItem {
                    Label("Recherche", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
