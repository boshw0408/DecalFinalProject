//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI
import SwiftData

@main
struct TriviaGameApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
                    .environmentObject(TriviaManager())
            }
            .navigationViewStyle(StackNavigationViewStyle()) // For consistent navigation
            .modelContainer(for: [Favorite.self]) // Register the SwiftData model
        }
    }
}

