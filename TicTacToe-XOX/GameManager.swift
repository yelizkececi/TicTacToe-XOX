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
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]
    
    init() {
        initializeGame()
    }
    
    func initializeGame() {
        for _ in 0...8 {
            squares.append(.b)
        }
        //randomizeGame()
    }
    
    func randomizeGame() {
        for _ in 1...45 {
            let randomIndex = Int.random(in: 0...8)
            squareTapped(at: IndexPath(row: randomIndex, section: 0))
        }
    }
    
    func restartGame() {
        squares.removeAll()
        initializeGame()
        winner = nil
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
        if (getWinner() == nil){
            
        }
        if turn == .x {
            return .o
        } else if turn == .o {
            return .x
        }
        
        return .b
    }
    
    func didSquaresFinish() -> Bool {
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
