//
//  ImageCollectionViewCell.swift
//  TicTacToe-XOX
//
//  Created by Yeliz Keçeci on 5.12.2020.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(square: Square) {
        imageView.image = square.image
    }
}
