//
//  AllFavoritesVM.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/24/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class AllFavoritesVM: NSObject {
    class func setUICell(cell: AllFavoritesCell, product: Product) {
        cell.imageLarge.sd_setImage(with: URL(string: product.image ), placeholderImage: UIImage(named: "KrekenSad"))
        cell.viewRoundCorners.layer.cornerRadius = 10
        cell.imageLarge.clipsToBounds = true
        cell.constraintHeightFirst.constant = product.linioPlusLevel == 0 ? 0 : 30
        switch product.linioPlusLevel {
        case 1:
            cell.imageFirstBadget.image = UIImage.init(named: "PlusSquare")
        case 2:
            cell.imageFirstBadget.image = UIImage.init(named: "Plus48Square")
        default:
            break
        }
        let imageState = product.conditionType == "refurbished" ? UIImage.init(named: "RefurbishedSquare") : UIImage.init(named: "NewSquare")
        cell.imageSecondBadget.image = imageState
        
        cell.imageThirdBadget.image = UIImage.init(named: "FreeShippingSquare")
        cell.contraintHeightThird.constant = product.freeShipping ? 30 : 0
        
        cell.imageFourthBadget.image = UIImage.init(named: "InternationalSquare")
        cell.contraintHeightFourth.constant = product.imported ? 30 : 0

        print(product)
        
    }
}
