//
//  ContentView.swift
//  RickMorty
//
//  Created by Kurilova Daria Kirillovna on 23.05.2023.
//

import SwiftUI

struct SearchView: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: .columnsSpacing), count: .columnsCount)
    let pictures = ["Picture", "Picture 1", "Picture 2", "Picture 3", "Picture 4"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: .rowSpacing) {
                    ForEach(pictures, id: \.self) { picture in
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
            .padding()
            .background(Color.background())
            .navigationTitle(String.title)
        }
    }
}

//MARK: - Extensions

extension CGFloat {
    static let columnsSpacing: CGFloat = 18
    static let rowSpacing: CGFloat = 23
    static let itemSpacing: CGFloat = 14
    static let imageHeight: CGFloat = 145
    static let imageMinWidth: CGFloat = 90
    static let imageMaxWidth: CGFloat = 125
    static let radius: CGFloat = 15
    static let textSize: CGFloat = 12
}

extension Int {
    static let columnsCount = 3
}

extension String {
    static let title = "Rickipedia"
}


//MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
