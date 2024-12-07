//
//  FavoriteView.swift
//  TriviaGame
//
//  Created by 황보성 on 12/6/24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var favoriteScores: [Score] // Fetch all scores

    var body: some View {
        NavigationView {
            List(favoriteScores.filter { $0.isFavorite }) { score in
                Text("Score: \(score.value)")
                    .font(.headline)
            }
            .navigationTitle("Favorite Scores")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
