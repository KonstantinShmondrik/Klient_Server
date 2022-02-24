//
//  UsersPhotoCollectionReusableView.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 23.02.2022.
//

import UIKit

class UsersPhotoCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var backPhoto: UIImageView!
    @IBOutlet weak var avatarLogo: UIImageView!{
        didSet{
            self.avatarLogo.layer.borderColor = UIColor.white.cgColor
            self.avatarLogo.layer.borderWidth = 0.8
            self.avatarLogo.clipsToBounds = true
            self.avatarLogo.layer.cornerRadius = self.avatarLogo.frame.width / 2
            
        }
    }
    
    @IBOutlet weak var userName: UILabel!
}
