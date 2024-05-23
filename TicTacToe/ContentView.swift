//
//  ContentView.swift
//  TicTacToe
//
//  Created by Muna Aiman Al-hajj on 15/11/1445 AH.
//

//import SwiftUI
//
//struct ContentView: View {
//    @ObservedObject var game = GameModel()
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Text(game.gameStatus)
//                .font(.title)
//                .padding()
//
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
//                ForEach(0..<9) { index in
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(game.isGameActive ? .blue : .gray)
//                            .opacity(0.8)
//                            .frame(width: 100, height: 100)
//                            .cornerRadius(10)
//                        Text(game.board[index])
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                    }
//                    .onTapGesture {
//                        game.makeMove(at: index)
//                    }
//                }
//            }
////            HStack {
////                TextField("Player X Name", text: $game.playerXName)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////                    .padding()
////                TextField("Player O Name", text: $game.playerOName)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////                    .padding()
////            }
//            Spacer()
//
//            Button("Restart Game") {
//                game.resetGame()
//            }
//            .padding()
//            .foregroundColor(.black)
//            .background(Color.appcolor)
//            .cornerRadius(10)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


import SwiftUI

struct ContentView: View {
    @ObservedObject var game = GameModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text(game.gameStatus)
                    .font(.title)
                    .padding()

                // Define the grid
                let gridSize = min(geometry.size.width, geometry.size.height) * 0.7 // Adjust grid size
                let cellSize = gridSize / 3

                VStack(spacing: 0) {
                    ForEach(0..<3) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<3) { column in
                                let index = row * 3 + column
                                ZStack {
                                    // Background color for touch feedback (optional)
                                    Color.clear
                                        .background(Color.white.opacity(0.001)) // Nearly invisible to enable tap
                                        .frame(width: cellSize, height: cellSize)

                                    // Text for X or O
                                    Text(game.board[index])
                                        .font(.system(size: cellSize / 2))
                                        .foregroundColor(.black)
                                    
                                }
                                .onTapGesture {
                                    game.makeMove(at: index)
                                }
                                .border(Color.black, width: 2) // Border to create grid lines
                            }
                            
                        }
                        
                    }
                    
                }
                .frame(width: gridSize, height: gridSize) // Fixing the grid size

                Spacer()
                
                Button("Restart Game") {
                    game.resetGame()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.appcolor)  // Change to match your app's theme
                .cornerRadius(10)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // Set the background color of the view
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
