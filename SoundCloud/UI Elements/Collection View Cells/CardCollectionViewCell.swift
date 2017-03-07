//
//  CardCollectionViewCell.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 3/6/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card? {
        didSet {
            guard let card = card else { return }
            frontImageView.image = card.image
        }
    }
    
    fileprivate(set) var shown: Bool = false
    
    // MARK: - Methods
    
    func showCard(_ show: Bool, animated: Bool) {
        frontImageView.isHidden = false
        backImageView.isHidden = false
        shown = show
        
        if animated {
            if show {
                UIView.transition(from: backImageView,
                                  to: frontImageView,
                                  duration: 0.5,
                                  options: [.transitionFlipFromRight, .showHideTransitionViews],
                                  completion: { (finished: Bool) -> () in
                })
            }
            else {
                UIView.transition(from: frontImageView,
                                  to: backImageView,
                                  duration: 0.5,
                                  options: [.transitionFlipFromRight, .showHideTransitionViews],
                                  completion:  { (finished: Bool) -> () in
                })
            }
        }
        else {
            if show {
                bringSubview(toFront: frontImageView)
                backImageView.isHidden = true
            }
            else {
                bringSubview(toFront: backImageView)
                frontImageView.isHidden = true
            }
        }
    }
}
