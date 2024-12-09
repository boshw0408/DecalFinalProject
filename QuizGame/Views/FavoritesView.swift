
//
//  FavoritesView.swift
//  QuizGame
//
//  Created by 황보성 on 12/8/24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query(sort: \Favorite.result, order: .forward) var favorites: [Favorite]

    var body: some View {
        ZStack {
            // Set background color
            Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118)
                .ignoresSafeArea()

            List {
                ForEach(favorites) { favorite in
                    HStack {
                        // Display the image for the favorite result
                        Image(getImageName(for: favorite.result))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        
                        // Display the text for the favorite result
                        Text(favorite.result)
                            .font(.body)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // Delete button
                        Button(action: {
                            deleteFavorite(favorite)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Favorites")
    }

    private func deleteFavorite(_ favorite: Favorite) {
        if let context = favorite.modelContext {
            context.delete(favorite)
        }
    }

    private func getImageName(for result: String) -> String {
        return result.replacingOccurrences(of: " ", with: "")
    }
}

