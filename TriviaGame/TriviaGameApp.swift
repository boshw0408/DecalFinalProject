//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

@main
struct TriviaGameApp: App {
    var body: some Scene {
        WindowGroup {
<<<<<<< HEAD
            ContentView()
                .environmentObject(TriviaManager())
=======
            NavigationView {
                StartView()
                    .environmentObject(TriviaManager())
            }
            .navigationViewStyle(StackNavigationViewStyle()) // For consistent navigation 
>>>>>>> triviagame
        }
        .modelContainer(for: [Score.self]) // Register the Score model for persistence
    }
}

