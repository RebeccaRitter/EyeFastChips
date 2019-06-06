//
//  GamecellCell.swift
//  twofold
//
//  Created by Allen Boynton on 11/23/18.
//  Copyright © 2018 Allen Boynton. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    // MARK: - Properties
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card? {
        didSet {
            guard let card = card else { return }
            frontImageView.image = card.image.imageWithInsets(insets: UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25))
            
            switch theme {
            case 0:
                backImageView.backgroundColor = .white
                backImageView.image = UIImage(named: "stickman")
            case 1:
                backImageView.backgroundColor = UIColor.rgb(red: 231, green: 80, blue: 69)
                backImageView.image = UIImage(named: "butterfly")
            case 2:
                backImageView.backgroundColor = UIColor.rgb(red: 230, green: 206, blue: 158)
                backImageView.image = UIImage(named: "wave")
            default:
                backImageView.backgroundColor = UIColor.rgb(red: 239, green: 135, blue: 51) // Orange
                backImageView.contentMode = .scaleAspectFill
                frontImageView.contentMode = .scaleAspectFill
                frontImageView.image = card.image.imageWithInsets(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            }
        }
    }
    
    fileprivate(set) var shown: Bool = false
    
    // MARK: - Methods
    func showCard(_ show: Bool, animated: Bool) {
        
        frontImageView.isHidden = false
        self.frontImageView.layer.borderWidth = 1.0
//        self.frontImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.frontImageView.layer.cornerRadius = 5.0
        self.frontImageView.layer.masksToBounds = true
        
        self.backImageView.isHidden = false
        self.backImageView.layer.borderWidth = 1.0
//        self.backImageView.layer.borderColor = UIColor.darkGray.cgColor
        self.backImageView.layer.cornerRadius = 5.0
        self.backImageView.layer.masksToBounds = true
        
        shown = show
        
        if animated {
            if show {
                UIView.transition(from: backImageView,
                                  to: frontImageView,
                                  duration: 0.3,
                                  options: [.transitionFlipFromLeft, .showHideTransitionViews],
                                  completion: { (finished: Bool) -> () in
                })
            } else {
                UIView.transition(from: frontImageView,
                                  to: backImageView,
                                  duration: 0.3,
                                  options: [.transitionFlipFromRight, .showHideTransitionViews],
                                  completion:  { (finished: Bool) -> () in
                })
            }
        } else {
            if show {
                bringSubviewToFront(frontImageView)
                backImageView.isHidden = true
            } else {
                bringSubviewToFront(backImageView)
                frontImageView.isHidden = true
            }
        }
    }
}
