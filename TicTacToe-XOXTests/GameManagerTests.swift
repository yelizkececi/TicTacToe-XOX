//
//  GameManagerTests.swift
//  TicTacToe-XOXTests
//
//  Created by Yeliz Keçeci on 11.12.2020.
//

import XCTest
@testable import TicTacToe_XOX

class GameManagerTests: XCTestCase {

    var game: GameManager!
    
    override func setUp(){
        super.setUp()
        game = GameManager()
    }
    
    func testInitializeGame() {
        XCTAssertEqual(game.squares.count, 9)
        XCTAssertEqual(game.winner, nil)
        XCTAssertEqual(game.turn, .x)
    }
    
    func testSquareTapped() {
        let selectedIndexPath = IndexPath(row: 1, section: 0)
        game.squareTapped(at: selectedIndexPath)
    }
}
