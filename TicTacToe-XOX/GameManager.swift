//
//  GameManager.swift
//  TicTacToe-XOX
//
//  Created by Yeliz Keçeci on 5.12.2020.
//

import UIKit

class GameManager {
    var squares: [Square] = []
    var turn: Square = .x
    var winner: Square?
    
    private let winConditions = [
        [0, 1, 2]
    ]
    
    init() {
        initializeGame()
    }
    
    func initializeGame() {
        for _ in 0...8 {
            squares.append(.b)
        }
    }
    
    func squareTapped(at indexPath: IndexPath) {
        let square = squares[indexPath.row]
        
        if square == .b {
            squares[indexPath.row] = turn
            turn = getOtherTurn()
            
            if let winner = getWinner() {
                self.winner = winner
            }
        }
    }
    
    private func getOtherTurn() -> Square {
        if turn == .x {
            return .o
        } else if turn == .o {
            return .x
        }
        
        return .b
    }
    
    func isGameEnded() -> Bool {
        return squares.filter { $0 == .b }.isEmpty
    }
    
    private func getWinner() -> Square? {
        for winCondition in winConditions {
            if squares[winCondition[0]] == .x && squares[winCondition[1]] == .x && squares[winCondition[2]] == .x {
                return .x
            } else if squares[winCondition[0]] == .o && squares[winCondition[1]] == .o && squares[winCondition[2]] == .o {
                return .o
            }
        }
        return nil
    }
}
