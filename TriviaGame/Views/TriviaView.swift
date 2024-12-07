//
//  TriviaView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager

    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))

                Text("Congratulations, you completed the game! 🥳")
                    .multilineTextAlignment(.center)

                if let result = triviaManager.finalResult {
                    Text("Your personality type is:")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Text(result)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AccentColor"))
                }

                Button {
                    triviaManager.restartQuiz()
                } label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984, green: 0.929, blue: 0.847))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
