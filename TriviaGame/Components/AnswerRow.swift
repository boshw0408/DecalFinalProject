//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var answer: TriviaModel.Answer
    @State private var isSelected = false

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
                .font(.caption)
                .foregroundColor(isSelected ? Color("AccentColor") : .gray)

            Text(answer.text)
                .bold()
                .foregroundColor(isSelected ? Color("AccentColor") : .black)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(isSelected ? Color("AccentColor").opacity(0.2) : .white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(
            answer: TriviaModel.Answer(text: "Staying in", outcomeType: 0, outcomeIndex: 1)
        ).environmentObject(TriviaManager())
    }
}
