//
//  ResultView.swift
//  TriviaGame
//
//  Created by ccheck on 12/6/24.
//

import SwiftUI

struct ResultView: View {
    let result: String
    @EnvironmentObject var triviaManager: TriviaManager // Use the shared instance
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Your type of boba is...")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            Text(result)
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("AccentColor"))
            
            // Display local image based on result
            Image(getImageName(for: result))
                 .resizable()
                 .scaledToFit()
                 .frame(height: 200)
                 .cornerRadius(10)
                 .shadow(radius: 5)
            
            Text(getDescription(for: result))
                .font(.body)
                .padding()
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button {
                triviaManager.restartQuiz()
            } label: {
                PrimaryButton(text: "Play Again")
            }
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.984, green: 0.929, blue: 0.847))
        .navigationBarHidden(true)
    }
    
    func getImageName(for result: String) -> String {
        return result.replacingOccurrences(of: " ", with: "")
    }

    // Function to return a description based on the result
    func getDescription(for result: String) -> String {
        switch result {
        case "Strawberry Milk Tea":
            return """
            Outgoing and energetic, you thrive in dynamic environments and enjoy taking risks. You are pragmatic and realistic, able to think on your feet and act decisively in any situation. Enjoying physical challenges, you are quick to adapt and always on the lookout for new experiences.
            """
        case "Oreo Smoothie":
            return """
            Efficient and organized, you take pride in managing tasks and ensuring everything is done to the highest standards. You value tradition and prefer to lead with structure, enforcing rules and expectations. Practical and decisive, you excel at creating plans and ensuring that projects are completed on time.
            """
        case "Mango Green Tea":
            return """
            Playful and enthusiastic, you bring energy to any situation and enjoy being the center of attention. You are adaptable and love connecting with others, making them feel happy and comfortable. Focused on the present moment, you enjoy having fun and seek excitement in life.
            """
        case "Brown Sugar Milk Tea":
            return """
            Friendly and sociable, you love helping others and creating a warm, welcoming environment. You enjoy organizing events and bringing people together, ensuring that everyone feels included. Practical and dependable, you excel in maintaining harmony and meeting the needs of those around you.
            """
        case "Coconut Smoothie":
            return """
            Strategic and inventive, you enjoy challenging others' ideas and finding creative solutions to problems. You are curious and enjoy debating, constantly pushing the boundaries of what’s possible. Highly adaptable and persuasive, you enjoy discussing various topics and generating innovative ideas.
            """
        case "Passion Fruit Green Tea":
            return """
            Caring and inspiring, you are dedicated to helping others reach their potential and creating positive change. You are a natural leader who values cooperation and seeks harmony in your relationships. Charismatic and empathetic, you can connect deeply with people and help them grow.
            """
        case "Taro Milk Tea":
            return """
            Enthusiastic and spontaneous, you are always looking for new ways to inspire others and explore ideas. You are an idealist, always looking for new possibilities and opportunities for personal growth. Outgoing and curious, you enjoy taking on new projects and connecting with people from all walks of life.
            """
        case "Peach Green Tea":
            return """
            Strategic and confident, you take charge of situations and excel in leading others to achieve their goals. You are highly logical and enjoy planning for the future, always aiming to improve processes and systems. Assertive and determined, you are motivated by challenges and strive for success in all areas of life.
            """
        case "Mango Smoothie":
            return """
            Action-oriented and adventurous, you enjoy solving practical problems and exploring new ways of doing things. You value freedom and flexibility, often choosing to work on your own terms. Highly analytical, you enjoy hands-on activities and have a natural skill for understanding mechanical systems.
            """
        case "Classic Milk Tea":
            return """
            Responsible, organized, and thorough, you take pride in your work and approach tasks with dedication. You enjoy structure and believe in following established rules and procedures. Trustworthy and dependable, you value tradition and work towards practical solutions.
            """
        case "Strawberry Smoothie":
            return """
            Gentle and sensitive, you enjoy expressing yourself through art and creating beautiful environments. You are empathetic and value personal growth and harmony with others. Flexible and spontaneous, you prefer to experience the world through personal exploration.
            """
        case "Milk Green Tea":
            return """
            Warm and considerate, you are deeply committed to helping others and making sure their needs are met. You are attentive and take great care in nurturing relationships with those you care about. You prefer stability and enjoy creating a peaceful, harmonious environment around you.
            """
        case "Thai Milk Tea":
            return """
            Intellectual and imaginative, you love exploring abstract concepts and solving complex problems. You thrive when you can think deeply and creatively, often developing new theories or ideas. Independent and reserved, you value intellectual freedom and dislike being confined by routine.
            """
        case "Caramel Milk Tea":
            return """
            Innovative and independent, you thrive when you can create original ideas and solve complex problems. Logical and strategic, you are able to see patterns and connections that others may overlook. You prefer to work alone and value efficiency and independence in your endeavors.
            """
        case "Strawberry Fruit Tea":
            return """
            Idealistic and insightful, you are driven by the desire to help others and make the world a better place. You are deeply empathetic and enjoy exploring new ideas and possibilities that align with your values. You tend to seek harmony and are highly attuned to the emotions of others.
            """
        case "Coconut Milk Tea":
            return """
            Creative and idealistic, you often feel deeply connected to your values and seek to make the world a better place. You are a natural empath and enjoy helping others understand themselves and their potential. You value authenticity and often find meaning in life’s possibilities rather than concrete outcomes.
            """
        default:
            return """
            You're a mix of wonderful qualities, uniquely your own! Embrace your individuality and celebrate the combination of traits that make you special.
            """
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResultView(result: "Strawberry Milk Tea")
        }
        .previewLayout(.sizeThatFits) // Ensures the preview fits nicely
    }
}
