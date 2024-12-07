import SwiftUI
import SwiftData

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @Environment(\.modelContext) private var modelContext
    @State private var showFavoriteList = false // State for navigation to favorites

    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .lilacTitle()

                Text("Congratulations, you completed the game! 🥳")
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")

                Button {
                    // Save the score
                    triviaManager.saveScore(modelContext: modelContext)
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }

                Button("Favorite This Score") {
                    triviaManager.favoriteCurrentScore(modelContext: modelContext)
                }
                .buttonStyle(.bordered)

                Button("View Favorite Scores") {
                    showFavoriteList = true
                }
                .buttonStyle(.bordered)
                .sheet(isPresented: $showFavoriteList) {
                    FavoritesView()
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984, green: 0.929, blue: 0.847))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

