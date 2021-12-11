//
//  AvailableGroupsCell.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 05.11.2021.
//

import UIKit

class AvailableGroupsCell: UITableViewCell {
   
   
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupPicture: UIImageView!
    {
        didSet{
            self.groupPicture.layer.borderColor = UIColor.gray.cgColor
            self.groupPicture.layer.borderWidth = 0.5
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
      
        groupPicture.clipsToBounds = true
        groupPicture.layer.cornerRadius = groupPicture.frame.width / 2
        groupPicture.layer.shadowColor = UIColor.black.cgColor
        groupPicture.layer.shadowRadius = 8
        groupPicture.layer.shadowOffset = CGSize.zero
        groupPicture.layer.shadowOpacity = 0.5
        groupPicture.backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.groupName.text = nil
        self.groupPicture.image = nil
    }
    
    // MARK: helpers functions
    
    func configurate(groupName: String, groupPicture: String) {
        self.groupName.text = groupName
        self.groupPicture.image = UIImage(named: groupPicture)
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
            
            self.groupPicture.layer.add(animation, forKey: nil)
            
        }
    
    @IBAction func clickLogoButton(_ sender: Any) {
        logoAnimait()
    }
    
    
}
