//
//  NewsHeaderViewCell.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 25.11.2021.
//

import UIKit

class NewsHeaderViewCell: UITableViewCell {

    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var usersLogo: UIImageView!{
        didSet{
            self.usersLogo.clipsToBounds = true
            self.usersLogo.layer.cornerRadius = self.usersLogo.frame.width / 2
            self.usersLogo.layer.shadowColor = UIColor.black.cgColor
            self.usersLogo.layer.shadowRadius = 8
            self.usersLogo.layer.shadowOffset = CGSize.zero
            self.usersLogo.layer.shadowOpacity = 0.5
        }
    }
    
    
    /*
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
      
        self.usersLogo.clipsToBounds = true
        self.usersLogo.layer.cornerRadius = self.usersLogo.frame.width / 2
        self.usersLogo.layer.shadowColor = UIColor.black.cgColor
        self.usersLogo.layer.shadowRadius = 8
        self.usersLogo.layer.shadowOffset = CGSize.zero
        self.usersLogo.layer.shadowOpacity = 0.5
//        usersLogo.backgroundColor = .clear
        
       
    }
 */

    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
