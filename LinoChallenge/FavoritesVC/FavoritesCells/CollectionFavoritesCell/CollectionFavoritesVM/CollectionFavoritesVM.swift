//
//  CollectionFavoritesVM.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/24/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class CollectionFavoritesVM: NSObject {
    class func setUICell(cell: CollectionFavoritesCell, product: Wishlist) {
        cell.viewRound.layer.cornerRadius = 10
        cell.labelTitleCollection.text = product.name
        cell.labelTitleCollection.sizeToFit()
        
        cell.labelCountCollection.text = "(\(product.products.count))"
        cell.labelCountCollection.sizeToFit()
        
        for (index, obj) in product.products.enumerated() {
            switch index {
            case 0:
                cell.imageLarge.sd_setImage(with: URL(string: obj.value.image ), placeholderImage: UIImage(named: "KrekenSad"))
            case 1:
                cell.imageSmallFirst.sd_setImage(with: URL(string: obj.value.image ), placeholderImage: UIImage(named: "KrekenSad"))
            case 2:
                cell.imageSmallSecond.sd_setImage(with: URL(string: obj.value.image ), placeholderImage: UIImage(named: "KrekenSad"))
                
            default:
                break
            }
        }
    }
}
