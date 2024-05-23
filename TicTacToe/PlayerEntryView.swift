//
//  PlayerEntryView.swift
//  TicTacToe
//
//  Created by Muna Aiman Al-hajj on 15/11/1445 AH.
//

import SwiftUI

struct PlayerEntryView: View {
    @State private var playerXName = ""
    @State private var playerOName = ""
    @State private var gameIsActive = false
    @State private var showError = false  // State to control the visibility of the error message

    var body: some View {
        if gameIsActive {
            ContentView(game: GameModel(playerXName: playerXName, playerOName: playerOName))
        } else {
            NavigationView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Player 1")
                            .font(.title2)
                            .bold()
                        TextField("Player X Name", text: $playerXName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Player 2")
                            .font(.title2)
                            .bold()
                        TextField("Player O Name", text: $playerOName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    // Error message
                    if showError {
                        Text("Please enter both player names.")
                            .foregroundColor(.red)
                            .padding()
                    }

                    Spacer()

                    Button("Start Game") {
                        // Check if both names are filled in
                        if playerXName.isEmpty || playerOName.isEmpty {
                            showError = true  // Show error message
                        } else {
                            showError = false
                            gameIsActive = true  // Start the game
                        }
                    }
                    .padding()
                    .frame(width: 300)
                    .foregroundColor(.white)
                    .background(Color.appcolor)  // Changed to blue for visual consistency
                    .cornerRadius(10)
                }
                .padding()
                .navigationTitle("TicTacToe Game")
            }
        }
    }
}
#Preview {
    PlayerEntryView()
}
