//
//  QuestionView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var navigateToResult = false

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("It's boba time!")
                    .lilacTitle()

                Spacer()

                Text("\(triviaManager.index + 1) / \(triviaManager.triviaModel.questions.count)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }

            ProgressBar(progress: triviaManager.progress)

            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)

                ForEach(triviaManager.answerChoices, id: \.text) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }

            Button {
                if triviaManager.reachedEnd {
                    navigateToResult = true
                } else {
                    triviaManager.goToNextQuestion()
                }
            } label: {
                PrimaryButton(
                    text: triviaManager.reachedEnd ? "See Results" : "Next",
                    background: triviaManager.answerSelected ? Color("AccentColor") : Color.gray.opacity(0.5)
                )
            }
            .disabled(!triviaManager.answerSelected)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 0.984, green: 0.929, blue: 0.847))
        .navigationBarHidden(true)
        .background(
            NavigationLink(
                destination: ResultView(result: triviaManager.finalResult ?? ""),
                isActive: $navigateToResult,
                label: { EmptyView() }
            )
        )
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
