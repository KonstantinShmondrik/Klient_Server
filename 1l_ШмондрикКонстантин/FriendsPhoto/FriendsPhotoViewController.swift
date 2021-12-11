//
//  FriendsPhotoViewController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 06.11.2021.
//

import UIKit



class FriendsPhotoViewController: UICollectionViewController {

    var photosVC = [UIImage(named: "01"), UIImage(named: "03"), UIImage(named: "04"),UIImage(named: "06")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosVC.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoSell", for: indexPath) as? FriendsPhotoCell else {return UICollectionViewCell()}
        
        let photoVC = photosVC[indexPath.row]
        cell.friendsPhoto.image = photoVC
        
        return cell
    }

 

   
}
