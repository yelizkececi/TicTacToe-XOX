//
//  ViewController.swift
//  TicTacToe-XOX
//
//  Created by Yeliz Keçeci on 5.12.2020.
//

import UIKit
import PMAlertController

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    let gameManager = GameManager()
    var alertVC = PMAlertController()
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.isHidden = true
        startButton.isHidden = true

    }
    
    func checkWinner() {
        if let winner = gameManager.winner {
            winLabel.isHidden = false
            winLabel.text = "Winner \(winner)"
            alert()
        } else if gameManager.didSquaresFinish(){
            winLabel.isHidden = false
            winLabel.text = "It's a draw"
            alert()
        }
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        gameManager.restartGame()
        collectionView.reloadData()
        collectionView.isHidden = false
        startButton.isHidden = true
        
    }
    
    func alert() {
        alertVC = PMAlertController(title: "Game Over", description: "Do you want to play game again?", image: UIImage(named: "gameover"), style: .alert)

        alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { [self]() in
            winLabel.isHidden = true
            gameManager.restartGame()
            collectionView.reloadData()
                }))
        alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { [self] () -> Void in
            collectionView.isHidden = true
            winLabel.isHidden = true
            startButton.isHidden = false
                }))
        self.present(alertVC, animated: true, completion: nil)
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
