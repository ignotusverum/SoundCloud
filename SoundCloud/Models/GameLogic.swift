//
//  GameLogic.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 3/6/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import Foundation
import UIKit.UIImage

// MARK: - MemoryGameDelegate

protocol GameProtocol {
    func gameDidStart(_ game: MemoryGame)
    func game(_ game: MemoryGame, showCards cards: [Track])
    func game(_ game: MemoryGame, hideCards cards: [Track])
    func gameDidEnd(_ game: MemoryGame, elapsedTime: TimeInterval)
}

class MemoryGame {
    
    // MARK: - Properties
    var cards:[Track] = []
    var delegate: GameProtocol?
    var isPlaying: Bool = false
    
    fileprivate var cardsShown: [Track] = []
    fileprivate var startTime: Date?
    
    var numberOfCards: Int {
        
        return cards.count
    }
    
    var elapsedTime : TimeInterval {
        
        guard startTime != nil else {
            return -1
        }
        return Date().timeIntervalSince(startTime!)
    }
    
    // MARK: - Methods
    
    func newGame(_ cardsData:[UIImage]) {
        cards = randomCards(cardsData)
        startTime = Date.init()
        isPlaying = true
        delegate?.gameDidStart(self)
    }
    
    func stopGame() {
        isPlaying = false
        cards.removeAll()
        cardsShown.removeAll()
        startTime = nil
    }
    
    func didSelectCard(_ card: Track?) {
        guard let card = card else { return }
        
        delegate?.game(self, showCards: [card])
        
        if unpairedCardShown() {
            
            let unpaired = unpairedCard()
            if card.isEqual(unpaired) {
                cardsShown.append(card)
            } else {
                let unpairedCard = cardsShown.removeLast()
                
                let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    self.delegate?.game(self, hideCards:[card, unpairedCard])
                }
            }
        } else {
            cardsShown.append(card)
        }
        
        if cardsShown.count == cards.count {
            finishGame()
        }
    }
    
    func cardAtIndex(_ index: Int) -> Track? {
        if cards.count > index {
            return cards[index]
        } else {
            return nil
        }
    }
    
    func indexForCard(_ card: Track) -> Int? {
        for index in 0...cards.count-1 {
            if card === cards[index] {
                return index
            }
        }
        return nil
    }
    
    fileprivate func finishGame() {
        isPlaying = false
        delegate?.gameDidEnd(self, elapsedTime: elapsedTime)
    }
    
    fileprivate func unpairedCardShown() -> Bool {
        return cardsShown.count % 2 != 0
    }
    
    fileprivate func unpairedCard() -> Track? {
        let unpairedCard = cardsShown.last
        return unpairedCard
    }
    
    fileprivate func randomCards(_ cardsData:[UIImage]) -> [Track] {
        
        cards.shuffle()
        return cards
    }
}
