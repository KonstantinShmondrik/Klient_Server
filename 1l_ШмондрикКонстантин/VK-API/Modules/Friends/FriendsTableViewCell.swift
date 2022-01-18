//
//  FriendsTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 06.01.2022.
//

import UIKit


class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namesFriend: UILabel!
    
    @IBOutlet weak var friendsLogoImage: UIImageView!
    
    @IBOutlet weak var friendsLogoView: UIView!{
        didSet {
            
            self.friendsLogoView.layer.borderColor = UIColor.gray.cgColor
            self.friendsLogoView.layer.borderWidth = 0.5
            self.friendsLogoView.clipsToBounds = true
            self.friendsLogoView.layer.cornerRadius = self.friendsLogoView.frame.width / 2
            self.friendsLogoView.layer.shadowColor = UIColor.black.cgColor
            self.friendsLogoView.layer.shadowRadius = 4
            self.friendsLogoView.layer.shadowOffset = .zero
            self.friendsLogoView.layer.shadowOpacity = 0.7
            self.friendsLogoView.backgroundColor = .clear
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

}
