//
//  FavoritesVC.swift
//  LinoChallenge
//
//  Created by Krakenbuild on 19/01/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    @IBOutlet weak var collectionFavorites: UICollectionView!
    var products = [Wishlist]()
    var allProducts = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vm = FavoritesVM.init(controller: self)
        vm.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoritesVC: FavoritesVMP {
    func updateWishlist(wishList: [Wishlist], allFavorites: [Product]) {
        products = wishList
        allProducts = allFavorites
        self.collectionFavorites.reloadData()
    }
}
