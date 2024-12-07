//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//


import Foundation
import SwiftUI


class TriviaManager: ObservableObject {
    
    private var triviaModel: TriviaModel
    
    // Variables to set question and answers
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [TriviaModel.Answer] = []
    
    // Variables for score and progress
    @Published private(set) var progress: CGFloat = 0.00
    
    // Variables to know if an answer has been selected and reached the end of trivia
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    @Published private(set) var finalResult: String? = nil
    
    init(){
        self.triviaModel = TriviaModel(questions: [
            TriviaModel.Question(
                question: "What would you be doing on a Friday night?",
                answers: [
                    TriviaModel.Answer(
                        text: "Staying in my room reading my favorite book, or hanging out with my roommate",
                        outcomeType: 0,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "Partying with all my friends!",
                        outcomeType: 0,
                        outcomeIndex: 0
                    )
                ]
            ),
            TriviaModel.Question(
                question: "How do you prefer to plan your day?",
                answers: [
                    TriviaModel.Answer(
                        text: "Make a detailed schedule",
                        outcomeType: 3,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "Go with the flow",
                        outcomeType: 3,
                        outcomeIndex: 0
                    )
                ]
            )
            // Add more questions as needed
        ])
        setQuestion()
    }
    
    // Function to set a new question and answer choices, and update the progress
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(triviaModel.questions.count) * 100)
        
        let currentQuestion = triviaModel.questions[index]
        question = AttributedString(currentQuestion.question)
        answerChoices = currentQuestion.answers
    }
    
    // Function to know that user selected an answer, and update the score
    func selectAnswer(answer: TriviaModel.Answer) {
        answerSelected = true
        
        // Record the selected answer in the trivia model
        triviaModel.recordAnswer(answer)
        
        // Move to the next question
        goToNextQuestion()
    }
    
    // Function to move to the next question or end the game
    func goToNextQuestion() {
        if index + 1 < triviaModel.questions.count {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
            calculateFinalResult()
        }
    }
    
    // Function to calculate the final result
    private func calculateFinalResult() {
        finalResult = triviaModel.calculateResult()
    }
        
    // Function to restart the quiz
    func restartQuiz() {
        index = 0
        reachedEnd = false
        finalResult = nil
        setQuestion()
    }
}
