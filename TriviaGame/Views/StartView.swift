//
//  StartView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

<<<<<<< HEAD:TriviaGame/Views/ContentView.swift
struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var showFavoriteList = false // State to show the favorite scores view
    
=======
struct StartView: View {
>>>>>>> triviagame:TriviaGame/Views/StartView.swift
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Boba Time!")
                        .lilacTitle()
                    
                    Text("What kind of boba are you most like?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                // Navigation Link to Trivia Game
                NavigationLink {
                    TriviaView()
                        .environmentObject(TriviaManager())
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
                // Button to show Favorite Scores
                Button(action: {
                    showFavoriteList = true
                }) {
                    Text("View Favorite Scores")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .sheet(isPresented: $showFavoriteList) {
                    FavoritesView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
