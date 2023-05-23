//
//  MainView.swift
//  RickMorty
//
//  Created by Kurilova Daria Kirillovna on 23.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Image(systemName: .searchIcon)
                    Text(String.searchTitle)
                }
            
            FavouriteView()
                .tabItem {
                    Image(systemName: .favouriteIcon)
                    Text(String.favouriteTitle)
                }
        }
        .accentColor(.green)
    }
}

//MARK: - Extensions

extension String {
    static let searchIcon = "magnifyingglass"
    static let favouriteIcon = "heart"
    static let searchTitle = "Search"
    static let favouriteTitle = "Favourite"
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
