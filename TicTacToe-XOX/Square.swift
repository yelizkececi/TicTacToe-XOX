//
//  ImageItem.swift
//  TicTacToe-XOX
//
//  Created by Yeliz Keçeci on 5.12.2020.
//

import UIKit

enum Square {
    case x
    case b
    case o

    var image: UIImage {
        switch self {
            case .x: return UIImage(named: "x.png")!
            case .b: return UIImage(named: "b.png")!
            case .o: return UIImage(named: "o.png")!
        }
    }
}
