//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import Foundation

struct TriviaModel {
    struct Question {
        let question: String
        let answers: [Answer]
    }
    
    struct Answer {
        let text: String
        let outcomeType: Int    // 0: E,I / 1: S,N / 2: T,F / 3: P,J
        let outcomeIndex: Int   // 0 or 1
    }
    
    let questions: [Question]
    private(set) var resultBits: [Int]
    
    init(questions: [Question])
    {
        self.questions = questions
        self.resultBits = [0,0,0,0]
    }
    
    mutating func recordAnswer(_ answer: Answer)
    {
        resultBits[answer.outcomeType] += answer.outcomeIndex
    }
    
    // Calculates the final result
    func calculateResult() -> String {
        let binaryResultBits = resultBits.map { count in
            count < 2 ? 0 : 1
        }
        
        // Convert result bits to personality type
        let finalResult: String
        print(resultBits)
        print(binaryResultBits)
        switch binaryResultBits {
            case [0, 0, 0, 0]: finalResult = "Strawberry Milk Tea"        // ESTP: Energetic and refreshing personality
            case [0, 0, 0, 1]: finalResult = "Oreo Smoothie"              // ESTJ: Unique and attention-grabbing personality
            case [0, 0, 1, 0]: finalResult = "Mango Green Tea"            // ESFP: Playful and enthusiastic personality
            case [0, 0, 1, 1]: finalResult = "Brown Sugar Milk Tea"       // ESFJ: Trendy and eager personality
            case [0, 1, 0, 0]: finalResult = "Coconut Smoothie"           // ENTP: Warm and approachable personality
            case [0, 1, 0, 1]: finalResult = "Passion Fruit Green Tea"    // ENFJ: Outgoing and friendly personality
            case [0, 1, 1, 0]: finalResult = "Taro Milk Tea"              // ENFP: Mysterious and thoughtful personality
            case [0, 1, 1, 1]: finalResult = "Peach Green Tea"            // ENTJ: Sweet and imaginative personality
            case [1, 0, 0, 0]: finalResult = "Mango Smoothie"             // ISTP: Passionate and hardworking personality
            case [1, 0, 0, 1]: finalResult = "Classic Milk Tea"           // ISTJ: Responsible and traditional personality
            case [1, 0, 1, 0]: finalResult = "Strawberry Smoothie"        // ISFP: Gentle and empathetic personality
            case [1, 0, 1, 1]: finalResult = "Milk Green Tea"             // ISFJ: Classic and calm personality
            case [1, 1, 0, 0]: finalResult = "Thai Milk Tea"              // INTP: Adventurous and spontaneous personality
            case [1, 1, 0, 1]: finalResult = "Caramel Milk Tea"           // INTJ: Analytical and logical personality
            case [1, 1, 1, 0]: finalResult = "Strawberry Fruit Tea"       // INFJ: Idealistic and insightful personality
            case [1, 1, 1, 1]: finalResult = "Coconut Milk Tea"           // INFP: Supportive and inclusive personality
            default: finalResult = "Unknown"                              // Fallback case
        }
        return finalResult
    }
}
