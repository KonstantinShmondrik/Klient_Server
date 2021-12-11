//
//  AvatarLogoImage.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 10.11.2021.
//

import UIKit

 class AvatarLogoImage: UIImageView {
    
    var radiuse = 50
    var avatarLogo: UIImageView! {
        didSet {
            self.avatarLogo.layer.borderColor = UIColor.gray.cgColor
            self.avatarLogo.clipsToBounds = true
            self.avatarLogo.layer.cornerRadius = avatarLogo.frame.width / 2
        }
    }

}
