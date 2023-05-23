//
//  ContentView.swift
//  RickMorty
//
//  Created by Kurilova Daria Kirillovna on 23.05.2023.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: .gridSpacing) {
                searchView
                gridView
            }
            .padding()
            .background(Color.background())
            .navigationTitle(String.title)
        }
    }
    
    var searchView: some View {
        TextField("Search", text: $viewModel.searchedText)
            .padding(.vertical, .searchVerticalSpacing)
            .padding(.trailing, .searchTrailingSpacing)
            .padding(.leading, .searchLeadingSpacing)
            .background(Color.search().opacity(.searchOpacity))
            .cornerRadius(.searchRadius)
            .foregroundColor(.text())
            .accentColor(.green)
            .overlay {
                xmarkAndSearchIcon
            }
    }
    
    var xmarkAndSearchIcon: some View {
        HStack {
            Image(systemName: .searchIcon)
                .foregroundColor(viewModel.searchedText.isEmpty ? .text().opacity(.iconOpacity) : .text())
            
            Spacer()
            
            if !viewModel.searchedText.isEmpty {
                Button {
                    viewModel.searchedText = ""
                } label: {
                    Image(systemName: .xmarkIcon)
                        .foregroundColor(.text())
                }
            }
            
        }
        .padding(.horizontal, .searchHorizontalSpacing)
    }
    
    var gridView: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns, spacing: .rowSpacing) {
                ForEach(viewModel.pictures, id: \.self) { picture in
                    VStack(spacing: .itemSpacing) {
                        Image(picture)
                            .resizable()
                            .frame(height: .imageHeight)
                            .frame(minWidth: .imageMinWidth, maxWidth: .imageMaxWidth)
                            .cornerRadius(.radius)
                        
                        Text(picture)
                            .foregroundColor(.text())
                            .font(.system(size: .textSize, weight: .regular))
                    }
                }
            }
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let gridSpacing: CGFloat = 19
    static let rowSpacing: CGFloat = 23
    static let itemSpacing: CGFloat = 14
    static let imageHeight: CGFloat = 145
    static let imageMinWidth: CGFloat = 90
    static let imageMaxWidth: CGFloat = 125
    static let radius: CGFloat = 15
    static let textSize: CGFloat = 12
    
    static let searchVerticalSpacing: CGFloat = 7
    static let searchTrailingSpacing: CGFloat = 8
    static let searchLeadingSpacing: CGFloat = 29
    static let searchRadius: CGFloat = 10
    static let searchHorizontalSpacing: CGFloat = 8
}

private extension String {
    static let title = "Rickipedia"
    static let xmarkIcon = "xmark.circle"
    static let searchIcon = "magnifyingglass"
}

private extension Double {
    static let searchOpacity: CGFloat = 0.24
    static let iconOpacity: CGFloat = 0.3
}


//MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
