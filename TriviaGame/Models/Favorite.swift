//
//  Favorite.swift
//  TriviaGame
//
//  Created by 황보성 on 12/8/24.
//

import SwiftData
import Foundation

@Model
class Favorite {
    @Attribute(.unique) var id: UUID
    var result: String

    init(result: String) {
        self.id = UUID()
        self.result = result
    }
}
