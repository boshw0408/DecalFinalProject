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
    private(set) var outcomeCounts: [Int: [Int]]
    
    init(questions: [Question])
    {
        self.questions = questions
        self.outcomeCounts = [
        0: [0, 0], // E: 0, I: 1
        1: [0, 0], // S: 0, N: 1
        2: [0, 0], // T: 0, F: 1
        3: [0, 0]  // P: 0, J: 1
    ]
    }
    
    mutating func recordAnswer(_ answer: Answer)
    {
        outcomeCounts[answer.outcomeType]?[answer.outcomeIndex] += 1
    }
    
    // Calculates the final result as a 4-letter personality type
        func calculateResult() -> String {
            let resultBits = outcomeCounts.keys.sorted().map { type -> Int in
                let counts = outcomeCounts[type] ?? [0, 0]
                return counts[0] > counts[1] ? 0 : 1
            }

            // Convert result bits to personality type
            return resultBits.enumerated().map { (index, bit) in
                switch (index, bit) {
                case (0, 0): return "E"
                case (0, 1): return "I"
                case (1, 0): return "S"
                case (1, 1): return "N"
                case (2, 0): return "T"
                case (2, 1): return "F"
                case (3, 0): return "P"
                case (3, 1): return "J"
                default: return ""
                }
            }.joined()
        }
    
}
