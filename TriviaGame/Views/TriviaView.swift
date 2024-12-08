import SwiftUI
import SwiftData

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(spacing: 20) {
            if triviaManager.reachedEnd {
                // Results Section
                Text("Your type of boba is...")
                    .font(.largeTitle)
                    .foregroundColor(.gray)

                if let result = triviaManager.finalResult {
                    Text(result)
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AccentColor"))

                    // Display the image for the result
                    Image(getImageName(for: result))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    // Display the description for the result
                    Text(getDescription(for: result))
                        .font(.body)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Button("Add to Favorites") {
                            addToFavorites(result)
                        }
                        .padding()
                        .background(Color(red: 0.768, green: 0.655, blue: 0.905))
                        .foregroundColor(.white)
                        .cornerRadius(10)

                        NavigationLink(destination: FavoritesView()) {
                            Text("View Favorites")
                                .padding()
                                .background(Color(red: 0.659, green: 0.835, blue: 0.729))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }

                Spacer()

                Button {
                    triviaManager.restartQuiz()
                } label: {
                    PrimaryButton(text: "Play Again")
                }
                .padding(.top)
            } else {
                // Trivia Questions Section
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
                        // No action needed as the result is already displayed
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
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.984, green: 0.929, blue: 0.847))
        .navigationBarHidden(true)
    }
    
    // Function to add to favorite
    func addToFavorites(_ result: String) {
            let favorite = Favorite(result: result)
            modelContext.insert(favorite)
        }

    // Function to return the image name for a result
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
        default:
            return "You're a mix of wonderful qualities, uniquely your own!"
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
