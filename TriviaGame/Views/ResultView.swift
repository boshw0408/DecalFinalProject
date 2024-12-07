//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct ResultView: View {
    let personalityType: String

    var body: some View {
        VStack(spacing: 20) {
            Text("Your Personality Type")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))

            Text(personalityType)
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))

            Text("Description for \(personalityType)")
                .multilineTextAlignment(.center)
                .padding()
                .font(.title3)

            Button(action: {
                // Navigate back to start or exit
            }) {
                PrimaryButton(text: "Play Again")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.984, green: 0.929, blue: 0.847))
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
