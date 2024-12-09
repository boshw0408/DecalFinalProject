//
//  Favorites.swift
//  TriviaGame
//
//  Created by 황보성 on 12/6/24.
//

import SwiftData


@Model
class Score {
    var value: Int
    var isFavorite: Bool // Indicates if the score is marked as a favorite

    init(value: Int, isFavorite: Bool = false) {
        self.value = value
        self.isFavorite = isFavorite
    }
}
