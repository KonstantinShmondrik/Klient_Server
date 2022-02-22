//
//  FriendsPhotosCollectionViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 07.01.2022.
//

import UIKit

class FriendsPhotosCollectionViewController: UICollectionViewController {
    
    var userId = ""
    
    private var allPhotosAPI = AllPhotosAPI()
    private var allPhotos: [AllPhotos] = []
    var photoService: PhotoService?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allPhotosAPI.getPhotosAll2(userId: userId) { [weak self] allPhotos in
            guard let self = self else {return}
            self.allPhotos = allPhotos
            self.collectionView.reloadData()
        }
       
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotos.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? FriendsPhotosCollectionViewCell else {return UICollectionViewCell()}
    
        let photo = allPhotos[indexPath.item]
        guard let photoURL = photo.sizes.last?.url else { return UICollectionViewCell() }
       
//        cell.photos.image = photoService?.photo(atIndexpath: indexPath, byUrl: photoURL)
        if let url = URL.init(string: photoURL) {

           
            cell.photos.sd_setImage(with: url)
        }
        return cell
    }
}
