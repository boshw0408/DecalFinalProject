//
//  QuestionView.swift
//  QuizGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager: QuizManager
    @State private var navigateToResult = false

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("It's boba time!")
                    .lilacTitle()

                Spacer()

                Text("\(quizManager.index + 1) / \(quizManager.quizModel.questions.count)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }

            ProgressBar(progress: quizManager.progress)

            VStack(alignment: .leading, spacing: 20) {
                Text(quizManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)

                ForEach(quizManager.answerChoices, id: \.text) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizManager)
                }
            }

            Button {
                if quizManager.reachedEnd {
                    navigateToResult = true
                } else {
                    quizManager.goToNextQuestion()
                }
            } label: {
                PrimaryButton(
                    text: quizManager.reachedEnd ? "See Results" : "Next",
                    background: quizManager.answerSelected ? Color("AccentColor") : Color.gray.opacity(0.5)
                )
            }
            .disabled(!quizManager.answerSelected)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 0.984, green: 0.929, blue: 0.847))
        .navigationBarHidden(true)
        .background(
            NavigationLink(
                destination: QuizView(),
                isActive: $navigateToResult,
                label: { EmptyView() }
            )
        )
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizManager())
    }
}
