//
//  AllFavoritesCell.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/24/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import UIKit

class AllFavoritesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLarge: UIImageView!
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var imageFirstBadget: UIImageView!
    @IBOutlet weak var imageSecondBadget: UIImageView!
    @IBOutlet weak var imageThirdBadget: UIImageView!
    @IBOutlet weak var imageFourthBadget: UIImageView!
    @IBOutlet weak var constraintHeightFirst: NSLayoutConstraint!
    @IBOutlet weak var contraintHeightSecond: NSLayoutConstraint!
    @IBOutlet weak var contraintHeightThird: NSLayoutConstraint!
    @IBOutlet weak var contraintHeightFourth: NSLayoutConstraint!
    @IBOutlet weak var viewRoundCorners: UIView!
}
