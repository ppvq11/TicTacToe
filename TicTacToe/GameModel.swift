//
//  GameModel.swift
//  TicTacToe
//
//  Created by Muna Aiman Al-hajj on 15/11/1445 AH.
//

import Foundation

class GameModel: ObservableObject {
    @Published var board: [String] = Array(repeating: "", count: 9)
        @Published var currentPlayer: String = "X"
        @Published var gameStatus: String = "X's turn"
        @Published var isGameActive: Bool = true

        var playerXName: String
        var playerOName: String

        init(playerXName: String = "Player 1", playerOName: String = "Player 2") {
            self.playerXName = playerXName
            self.playerOName = playerOName
        }

    func makeMove(at index: Int) {
        if board[index] == "" && isGameActive {
            board[index] = currentPlayer
            checkForWinner()
            if isGameActive {
                switchPlayers()
            }
        }
    }

    private func switchPlayers() {
        currentPlayer = currentPlayer == "X" ? "O" : "X"
        let currentPlayerName = currentPlayer == "X" ? playerXName : playerOName
        gameStatus = "\(currentPlayerName)'s turn"
    }

    private func checkForWinner() {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]

        for pattern in winPatterns {
            if !board[pattern[0]].isEmpty,
               board[pattern[0]] == board[pattern[1]],
               board[pattern[1]] == board[pattern[2]] {
                let winnerName = currentPlayer == "X" ? playerXName : playerOName
                gameStatus = "\(winnerName) has won!"
                isGameActive = false
                return
            }
        }

        if !board.contains("") {
            gameStatus = "Game Draw"
            isGameActive = false
        }
    }

    func resetGame() {
        board = Array(repeating: "", count: 9)
        currentPlayer = "X"
        gameStatus = "\(playerXName)'s turn"
        isGameActive = true
    }
}
