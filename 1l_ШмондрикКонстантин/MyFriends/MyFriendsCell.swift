//
//  MyFriendsCell.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 05.11.2021.
//

import UIKit

@IBDesignable class MyFriendsCell: UITableViewCell {

    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var avatarLogo: UIImageView! {
        didSet{
            self.avatarLogo.layer.borderColor = UIColor.gray.cgColor
            self.avatarLogo.layer.borderWidth = 0.5
        }
    }
    
    @IBInspectable var radius: CGFloat = 50 { // Позже допишу функционал для возможности                                                изменения на сториборде
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
      
        avatarLogo.clipsToBounds = true
        avatarLogo.layer.cornerRadius = avatarLogo.frame.width / 2
        avatarLogo.layer.shadowColor = UIColor.black.cgColor
        avatarLogo.layer.shadowRadius = 8
        avatarLogo.layer.shadowOffset = CGSize.zero
        avatarLogo.layer.shadowOpacity = 0.5
        avatarLogo.backgroundColor = .clear
        
       
    }
 
    override func prepareForReuse() {
        super.prepareForReuse()
        self.friendName.text = nil
        self.avatarLogo.image = nil
    }
    
    // MARK: helpers functions
    
    func configurate(friendName: String, avatarLogo: String) {
        self.friendName.text = friendName
        self.avatarLogo.image = UIImage(named: avatarLogo) 
        self.backgroundColor = .clear
    }

// анимация для аватара при нажатии на него
    func logoAnimait () {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 100
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.avatarLogo.layer.add(animation, forKey: nil)
        
    }

//    нажатие на аватар
    @IBAction func clickLogoButton(_ sender: Any) {
        logoAnimait()
    }
    
}
