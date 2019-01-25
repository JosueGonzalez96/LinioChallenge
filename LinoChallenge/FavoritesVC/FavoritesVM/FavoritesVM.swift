//
//  FavoritesVM.swift
//  LinoChallenge
//
//  Created by Alberto Gonzalez on 1/24/19.
//  Copyright © 2019 Alberto Josue Gonzalez Juarez. All rights reserved.
//

import Foundation
import UIKit

class FavoritesVM {
    init(controller: FavoritesVC) {
        setUI(controller: controller)
    }
    
    func setUI(controller: FavoritesVC) {
        controller.collectionFavorites.delegate = controller
        controller.collectionFavorites.dataSource = controller

        let leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "add_button"), style: .done, target: self, action: #selector(self.addButton))
        controller.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    @objc func addButton() {
        print("add button")
    }
}

extension FavoritesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let  headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCRV", for: indexPath) as! HeaderCRV
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
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = indexPath.section == 0 ? collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionFavoritesCell", for: indexPath) as! CollectionFavoritesCell : collectionView.dequeueReusableCell(withReuseIdentifier: "AllFavoritesCell", for: indexPath) as! AllFavoritesCell
        
        return cell
    }
}
extension FavoritesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero

    }
}
