//
//  GamePlayTests.swift
//  TicTacToe-XOXTests
//
//  Created by Yeliz Keçeci on 22.12.2020.
//

import XCTest
@testable import TicTacToe_XOX

class GamePlayTests: XCTestCase {

    var gameManager = GameManager()
    
    override func setUp() {
        super.setUp()
        
        gameManager = GameManager()
        gameManager.initializeGame()
    }
    
    func testXWin() {
        gameManager.squareTapped(at: IndexPath(row: 0, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 1, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 3, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 9, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 6, section: 0))
        XCTAssertEqual(gameManager.winner, .x)
    }
    func testOWin() {
        gameManager.squareTapped(at: IndexPath(row: 9, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 2, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 7, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 4, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 0, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 6, section: 0))
        XCTAssertEqual(gameManager.winner, .o)
    }
    func testTie() {
        gameManager.squareTapped(at: IndexPath(row: 0, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 8, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 4, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 1, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 6, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 2, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 7, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 3, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 5, section: 0))
        XCTAssertFalse(gameManager.didSquaresFinish())
    }
    func testTapAfterGame() {
        gameManager.squareTapped(at: IndexPath(row: 9, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 2, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 7, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 4, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 0, section: 0))
        gameManager.squareTapped(at: IndexPath(row: 6, section: 0))
        //Game Ended
        gameManager.squareTapped(at: IndexPath(row: 1, section: 0))
        XCTAssertEqual(gameManager.squares[1], .b)
        
    }
}
