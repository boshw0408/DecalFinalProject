//
//  QuizGame.swift
//  QuizGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI
import SwiftData

@main
struct QuizGameApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
                    .environmentObject(QuizManager())
            }
            .navigationViewStyle(StackNavigationViewStyle()) 
            .modelContainer(for: [Favorite.self])
        }
    }
}

