//
//  FavoritesVM.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/24/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Alamofire
protocol FavoritesVMP {
    func updateWishlist(wishList: [Wishlist], allFavorites: [Product])
}
class FavoritesVM {
    var collectionList = [Wishlist]()
    var delegate: FavoritesVMP?
    var products = [Wishlist]()

    init(controller: FavoritesVC) {
        setUI(controller: controller)
    }
    
    func setUI(controller: FavoritesVC) {
        controller.collectionFavorites.delegate = controller
        controller.collectionFavorites.dataSource = controller

        let leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "add_button"), style: .done, target: self, action: #selector(self.addButton))
        controller.navigationItem.leftBarButtonItem = leftBarButtonItem
        controller.navigationItem.leftBarButtonItem?.tintColor = UIColor.init(red: 177.0/255, green: 177.0/255, blue: 177.0/255, alpha: 1.0)
        getFavorites()
    }
    @objc func addButton() {
        print("add button")
    }
    

    func getFavorites() {
        ServiceCall.initWithURl(url: "https://gist.githubusercontent.com/egteja/98ad43f47d40b0868d8a954385b5f83a/raw/5c00958f81f81d6ba0bb1b1469c905270e8cdfed/wishlist.json", completion: {
            (err, obj) in
            if err == nil {
                if obj != nil{
                    
                    let arr = obj as! NSArray
                    var collectionList = [Wishlist]()
                    for obj in arr {
                        let wish = Mapper<Wishlist>().map(JSON: obj as! [String : Any])
                        collectionList.append(wish!)
                    }
                    DispatchQueue.main.async {
                        var arr = [Product]()
                        for obj in collectionList {
                            for product in obj.products {
                                arr.append(product.value)
                            }
                        }
                        self.delegate?.updateWishlist(wishList: collectionList, allFavorites: arr )
                    }
                }
            }
        })
    }
}

extension FavoritesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let  headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCRV", for: indexPath) as! HeaderCRV
        headerView.labelTitleSection.text = "Todos mis favoritos (\(self.allProducts.count))"
        if indexPath.section == 1 {
            headerView.frame = CGRect.zero
        }
        return headerView
    }
}
extension FavoritesVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.products.count
        }
        
        return self.allProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionFavoritesCell", for: indexPath) as! CollectionFavoritesCell
             CollectionFavoritesVM.setUICell(cell: cell, product: self.products[indexPath.row])
            return cell
        case 1:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "AllFavoritesCell", for: indexPath) as! AllFavoritesCell
            AllFavoritesVM.setUICell(cell: cell, product: self.allProducts[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
extension FavoritesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero

    }
}
