//
//  SearchViewModel.swift
//  RickMorty
//
//  Created by Kurilova Daria Kirillovna on 23.05.2023.
//

import SwiftUI

extension SearchView {
    @MainActor class SearchViewModel: ObservableObject {
        @Published var searchedText: String = ""
        
        let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: .columnsSpacing), count: .columnsCount)
        let pictures = ["Picture", "Picture 1", "Picture 2", "Picture 3", "Picture 4"]
    }
}

private extension CGFloat {
    static let columnsSpacing: CGFloat = 18
}

private extension Int {
    static let columnsCount = 3
}
