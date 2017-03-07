//
//  GameViewController.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 3/6/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    /// Game collection view
    @IBOutlet weak var collectionView: UICollectionView!

    /// Timer
    var timer:Timer?
    @IBOutlet weak var timerLabel: UILabel!
    
    /// Play
    @IBOutlet weak var playButton: UIButton!
    
    let gameLogic = MemoryGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaylistAdapter.fetch().then { result in
            
            print(result)
        }
        
        /// Setting up delegate logic
//        gameLogic.delegate = self
        
        /// Initial reset
//        resetGame()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        /// Reset if view dissapeared
        if gameLogic.isPlaying {
            resetGame()
        }
    }
    
    // MARK: - Methods
    
    func resetGame() {
        
        gameLogic.stopGame()
        
        if timer?.isValid == true {
            
            timer?.invalidate()
            timer = nil
        }
        
        collectionView.isUserInteractionEnabled = false
        collectionView.reloadData()
        
        timerLabel.text = String(format: "%@: ---", NSLocalizedString("TIME", comment: "time"))
        
        playButton.setTitle(NSLocalizedString("Play", comment: "play"), for: UIControlState())
    }
    
    @IBAction func didPressPlayButton() {
        
        if gameLogic.isPlaying {
            
            resetGame()
            playButton.setTitle(NSLocalizedString("Play", comment: "play"), for: UIControlState())
        }
        else {
            
            setupNewGame()
            playButton.setTitle(NSLocalizedString("Stop", comment: "stop"), for: UIControlState())
        }
    }
    
    func setupNewGame() {
        
//        let cardsData:[UIImage] = MemoryGame.defaultCardImages
//        gameLogic.newGame(cardsData)
    }
    
    func gameTimerAction() {
        
        timerLabel.text = String(format: "%@: %.0fs", NSLocalizedString("TIME", comment: "time"), gameLogic.elapsedTime)
    }
    
    func savePlayerScore(_ name: String, score: TimeInterval) {
//        Highscores.sharedInstance.saveHighscore(name, score: score)
    }
    
    // MARK: - MemoryGameDelegate
    
    func memoryGameDidStart(_ game: MemoryGame) {
        collectionView.reloadData()
        collectionView.isUserInteractionEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameViewController.gameTimerAction), userInfo: nil, repeats: true)
    }
    
    func memoryGame(_ game: MemoryGame, showCards cards: [Card]) {
        for card in cards {
            guard let index = gameLogic.indexForCard(card) else { continue }
            let cell = collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! CardCollectionViewCell
            cell.showCard(true, animated: true)
        }
    }
    
    func memoryGame(_ game: MemoryGame, hideCards cards: [Card]) {
        for card in cards {
            guard let index = gameLogic.indexForCard(card) else { continue }
            let cell = collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! CardCollectionViewCell
            cell.showCard(false, animated: true)
        }
    }
    
    func memoryGameDidEnd(_ game: MemoryGame, elapsedTime: TimeInterval) {
        timer?.invalidate()
        
        let elapsedTime = gameLogic.elapsedTime
        
        let alertController = UIAlertController(
            title: NSLocalizedString("Hurrah!", comment: "title"),
            message: String(format: "%@ %.0f seconds", NSLocalizedString("You finished the game in", comment: "message"), elapsedTime),
            preferredStyle: .alert)
        
        let saveScoreAction = UIAlertAction(title: NSLocalizedString("Save Score", comment: "save score"), style: .default) { [weak self] (_) in
            let nameTextField = alertController.textFields![0] as UITextField
            guard let name = nameTextField.text else { return }
            self?.savePlayerScore(name, score: elapsedTime)
            self?.resetGame()
        }
        saveScoreAction.isEnabled = false
        alertController.addAction(saveScoreAction)
        
        alertController.addTextField { (textField) in
            textField.placeholder = NSLocalizedString("Your name", comment: "your name")
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange,
                                                   object: textField,
                                                   queue: OperationQueue.main) { (notification) in
                                                    saveScoreAction.isEnabled = textField.text != ""
            }
        }
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Dismiss", comment: "dismiss"), style: .cancel) { [weak self] (action) in
            self?.resetGame()
        }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) { }
    }
}

// MARK: - Collection View
extension GameViewController: UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameLogic.numberOfCards > 0 ? gameLogic.numberOfCards : 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCollectionViewCell
        cell.showCard(false, animated: false)
        
        guard let card = gameLogic.cardAtIndex(indexPath.item) else { return cell }
        cell.card = card
        
        return cell
    }
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth: CGFloat = collectionView.frame.width / 3.0 - 15.0 //numberOfColumns as CGFloat - 10 //- (minimumInteritemSpacing * numberOfColumns))
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension GameViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        if cell.shown { return }
        gameLogic.didSelectCard(cell.card)
        
        collectionView.deselectItem(at: indexPath, animated:true)
    }
}
