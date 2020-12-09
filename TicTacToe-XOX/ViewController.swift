//
//  ViewController.swift
//  TicTacToe-XOX
//
//  Created by Yeliz Keçeci on 5.12.2020.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    let gameManager = GameManager()
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkWinner() {
        
    }
}

//MARK: - CollectionView Delegations
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameManager.squares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageItem = gameManager.squares[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        cell.configure(square: imageItem)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameManager.squareTapped(at: indexPath)
        self.collectionView.reloadData()
        checkWinner()
    }
}
