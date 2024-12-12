//
//  StartView.swift
//  QuizGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Boba Time!")
                        .lilacTitle()
                    
                    Text("What kind of boba are you most like?")
                        .foregroundColor(Color("AccentColor"))
                    
                    Image("appicon")
                            .resizable()
                            .scaledToFit() 
                            .frame(width: 150, height: 150) // Adjust size as needed
                            .clipShape(Circle()) // Optional: Renders the logo as a circle
                            .shadow(radius: 10) // Adds a shadow for a polished look
                        
                }
                
                NavigationLink {
                    QuizView()
                        .environmentObject(QuizManager())
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
                NavigationLink(destination: FavoritesView()) {
                    PrimaryButton(text: "View Favorites")
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
