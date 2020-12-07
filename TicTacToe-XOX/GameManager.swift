//
//  GameManager.swift
//  TicTacToe-XOX
//
//  Created by Yeliz Keçeci on 5.12.2020.
//

import UIKit

class GameManager {
    private let xIcon: UIImage = UIImage(named: "x")!
    private let oIcon: UIImage = UIImage(named: "o")!
    private let bIcon: UIImage = UIImage(named: "b")!
    var images: [Image] = []
    var users:[User] = []
    var player: String? = nil
    init() {
        initializeGame()
    }
    
    func initializeGame() {
        for _ in 0...8 {
            images.append(Image(image: bIcon, isHidden: true))
        }
        
        users.append(User(user: "X", image: Image(image: xIcon, isHidden: true)))
        users.append(User(user: "O", image: Image(image: oIcon, isHidden: true)))
        
        player = users[0].user as String
    }
    
    func tappedOnChangeImage(indexPath: IndexPath) {
        
        if player == "X" {
            images[indexPath.row].image = xIcon
            player = users[1].user as String
        } else if player == "O"{
            images[indexPath.row].image = oIcon
            player = users[0].user as String
        }
    }
}
