//
//  TriviaManager.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//


import Foundation
import SwiftUI


class TriviaManager: ObservableObject {
    
    var triviaModel: TriviaModel
    
    // Variables to set question and answers
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [TriviaModel.Answer] = []
    
    // Variables for score and progress
    @Published private(set) var progress: CGFloat = 0.00
    
    // Variables to know if an answer has been selected and reached the end of trivia
    @Published var answerSelected = false
    @Published private(set) var reachedEnd = false
    @Published private(set) var finalResult: String? = nil
    
    // 0: E,I / 1: S,N / 2: T,F / 3: J,P
    init(){
        self.triviaModel = TriviaModel(questions: [
            TriviaModel.Question(
                question: "Suddenly, tomorrow has been declared a national holiday, so you have the day off.",
                answers: [
                    TriviaModel.Answer(
                        text: "Yay! Let's go out and have fun!",
                        outcomeType: 0,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "Yay! Time to binge-watch YouTube!",
                        outcomeType: 0,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "You went to a local restaurant, and the owner served you cakes.",
                answers: [
                    TriviaModel.Answer(
                        text: "Yay! (ready to eat).",
                        outcomeType: 1,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "Why did he give me this cake?",
                        outcomeType: 1,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "A story that makes me even happier is...",
                answers: [
                    TriviaModel.Answer(
                        text: "I think you’re someone who can accomplish anything, anywhere.",
                        outcomeType: 2,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "You’re the kind of person I want to stay close to for a long time.",
                        outcomeType: 2,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "Because plans can fall apart at any time...",
                answers: [
                    TriviaModel.Answer(
                        text: "Prepare backup plans B and C in advance.",
                        outcomeType: 3,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "I’m flexible and resourceful. I can overcome it.",
                        outcomeType: 3,
                        outcomeIndex: 0
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "If one day, smells became visible like coloured smoke...",
                answers: [
                    TriviaModel.Answer(
                        text: "I’m curious to know what colour my scent would be.",
                        outcomeType: 1,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "That sounds uncomfortable.",
                        outcomeType: 1,
                        outcomeIndex: 0
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "When I’m among people...",
                answers: [
                    TriviaModel.Answer(
                        text: "I’m someone whose presence is always noticeable, no matter where I am.",
                        outcomeType: 0,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "I’m someone who is essential, even if my presence is subtle.",
                        outcomeType: 0,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "Looking back after overcoming tough times...",
                answers: [
                    TriviaModel.Answer(
                        text: "It was thanks to my experiences and efforts.",
                        outcomeType: 2,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "It was thanks to the warm support and encouragement I received.",
                        outcomeType: 2,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "If one morning, you suddenly became fluent in Korean...",
                answers: [
                    TriviaModel.Answer(
                        text: "Make Korean friends, haha.",
                        outcomeType: 0,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "Watch Netflix K-dramas without subtitles, haha.",
                        outcomeType: 0,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "You bought tanghulu, but the sugar coating looks too thick...",
                answers: [
                    TriviaModel.Answer(
                        text: "Oh... If I eat it wrong, I might hurt my mouth. Better eat it carefully.",
                        outcomeType: 1,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "(Smirking) Let’s see just how thick it is by trying it.",
                        outcomeType: 1,
                        outcomeIndex: 0
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "The kind of boss I want to work with is...",
                answers: [
                    TriviaModel.Answer(
                        text: "A boss with exceptional insight to identify the core of the problem.",
                        outcomeType: 2,
                        outcomeIndex: 0
                    ),
                    TriviaModel.Answer(
                        text: "A boss with outstanding tolerance to embrace diversity.",
                        outcomeType: 2,
                        outcomeIndex: 1
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "A situation that stresses me out more is...",
                answers: [
                    TriviaModel.Answer(
                        text: "When everything I planned falls apart, and I can’t accomplish a single thing properly.",
                        outcomeType: 3,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "When everything is so planned out that I don’t have a moment of freedom.",
                        outcomeType: 3,
                        outcomeIndex: 0
                    )
                ]
            ),
            
            TriviaModel.Question(
                question: "If a friend I’m traveling with hands me a detailed schedule broken into 30-minute intervals...",
                answers: [
                    TriviaModel.Answer(
                        text: "Oh, nice. Let’s review it together and find areas to adjust.",
                        outcomeType: 3,
                        outcomeIndex: 1
                    ),
                    TriviaModel.Answer(
                        text: "Oh, nice. (This feels intense... This trip won’t be easy…).",
                        outcomeType: 3,
                        outcomeIndex: 0
                    )
                ]
            )
        ])
        setQuestion()
    }
    
    // Function to set a new question and answer choices, and update the progress
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(triviaModel.questions.count) * 350)
        
        let currentQuestion = triviaModel.questions[index]
        question = AttributedString(currentQuestion.question)
        answerChoices = currentQuestion.answers
    }
    
    // Function to know that user selected an answer, and update the score
    func selectAnswer(answer: TriviaModel.Answer) {
        answerSelected = true
        
        // Debug: Print the selected answer
        print("Selected answer: \(answer.text), OutcomeType: \(answer.outcomeType), OutcomeIndex: \(answer.outcomeIndex)")
        
        // Record the selected answer in the trivia model
        triviaModel.recordAnswer(answer)
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
