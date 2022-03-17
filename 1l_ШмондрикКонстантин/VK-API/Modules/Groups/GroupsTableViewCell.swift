//
//  GroupsTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 06.01.2022.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    @IBOutlet weak var groupsName: UILabel!
   
    @IBOutlet weak var groupsLogoView: UIView!{
        didSet {
            self.groupsLogoView.layer.borderColor = UIColor.brandGrey.cgColor
            self.groupsLogoView.layer.borderWidth = 0.5
            self.groupsLogoView.clipsToBounds = true
            self.groupsLogoView.layer.cornerRadius = self.groupsLogoView.frame.width / 2
            self.groupsLogoView.layer.shadowColor = UIColor.black.cgColor
            self.groupsLogoView.layer.shadowRadius = 15
            self.groupsLogoView.layer.shadowOffset = CGSize.zero
            self.groupsLogoView.layer.shadowOpacity = 0.5
            self.groupsLogoView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var groupsLogoImageView: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
