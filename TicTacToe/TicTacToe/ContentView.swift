//
//  ContentView.swift
//  TicTacToe
//
//  Created by Ang T on 2023-11-17.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State private var board: [[String?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @State private var currentPlayer = "x.square.fill"

    var body: some View {
        VStack{
            if(currentPlayer == "x.square.fill"){
                Text("Turn: Player X")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 50.0)
                    
            }else{
                Text("Turn: Player O")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 50.0)

            }
            LazyVGrid(columns: columns) {
                ForEach(0..<3, id: \.self) { row in
                    ForEach(0..<3, id: \.self) { col in
                        Button(action: {
                            squareTapped(row: row, col: col)
                        }) {
                            Image(systemName: board[row][col] ?? "square")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            
            if(checkWinner() == "x.square.fill"){
                Text("Player X is the winner")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 50.0)
            }else if(checkWinner() == "o.square.fill"){
                Text("Player O is the winner")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 50.0)
            }
        }
    }

    private func squareTapped(row: Int, col: Int){
        guard board[row][col] == nil else {
            return // Square already tapped
        }
        
        board[row][col] = currentPlayer
        currentPlayer = (currentPlayer == "x.square.fill") ? "o.square.fill" : "x.square.fill"
        }
    
    private func checkWinner() -> String?{
        for i in 0..<3{
            if checkThree(board[i]) != nil{
                return checkThree(board[i])
            }
            if checkThree([board[0][i], board[1][i], board[2][i]]) != nil{
                return checkThree([board[0][i], board[1][i], board[2][i]])
            }
        }
        if checkThree([board[0][0], board[1][1], board[2][2]]) != nil {
            return checkThree([board[0][0], board[1][1], board[2][2]])
        }
        if checkThree([board[0][2], board[1][1], board[2][0]]) != nil {
            return checkThree([board[0][2], board[1][1], board[2][0]])
        }
        return nil
    }
    
    private func checkThree(_ elements: [String?]) -> String?{
        if (elements[0] == elements[1] && elements[1] == elements[2]){
            return elements[0]
        }
    
        return nil
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


