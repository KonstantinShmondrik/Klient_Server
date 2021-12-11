//
//  FriendsPhotoCell.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 06.11.2021.
//

import UIKit

class FriendsPhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var friendsPhoto: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
   
    func transportationBtnLike(){
        UIView.transition(with: btnLike,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
        })
    }
    
    @IBAction func btnLikeClick(_ sender: Any) {
        transportationBtnLike()
       
        if btnLike.tag == 0 {           // пустое значение
            
            
            btnLike.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            btnLike.configuration?.baseForegroundColor = UIColor.red
            btnLike.setTitle("1", for: .normal)
            btnLike.setTitleColor(.red, for: .normal)
            btnLike.tag = 1

        } else {
            btnLike.setImage(UIImage(systemName: "suit.heart"), for: .normal) 
            btnLike.configuration?.baseForegroundColor = UIColor.gray
            btnLike.setTitle("0", for: .normal)
            btnLike.setTitleColor(.gray, for: .normal)
            btnLike.tag = 0
        }
    }
}
