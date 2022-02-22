//
//  PhotosCollectionViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//

import UIKit
import SDWebImage


final class PhotosCollectionViewController: UICollectionViewController {
    
    private var allPhotosAPI = AllPhotosAPI()
    private var allPhotos: [AllPhotos] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        allPhotosAPI.getPhotosAll { [weak self] allPhotos in
            guard let self = self else {return}
            self.allPhotos = allPhotos
            self.collectionView.reloadData()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        
        let photo = allPhotos[indexPath.item]
        guard let photoURL = photo.sizes.last?.url else { return UICollectionViewCell() }
        if let url = URL.init(string: photoURL) {
            
            cell.photos.sd_setImage(with: url)
        }
        
        return cell
    }
    
}
