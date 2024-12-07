//
//  TriviaGameApp.swift
//  TriviaGame
//
//  Created by Stephanie Diep on 2021-12-17.
//

import SwiftUI

@main
struct TriviaGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TriviaManager())
        }
        .modelContainer(for: [Score.self]) // Register the Score model for persistence
    }
}
