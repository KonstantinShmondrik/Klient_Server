//
//  AutorOfFeedTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit
import SDWebImage

class AutorOfFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var autorName: UILabel!
    @IBOutlet weak var autorPhoto: UIImageView! {
        didSet {
            self.autorPhoto.layer.borderColor = UIColor.brandGrey.cgColor
            self.autorPhoto.layer.borderWidth = 0.5
            self.autorPhoto.clipsToBounds = true
            self.autorPhoto.layer.cornerRadius = self.autorPhoto.frame.width / 2
            self.autorPhoto.layer.shadowColor = UIColor.black.cgColor
            self.autorPhoto.layer.shadowRadius = 15
            self.autorPhoto.layer.shadowOffset = CGSize.zero
            self.autorPhoto.layer.shadowOpacity = 0.5
            self.autorPhoto.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var dateOfPublication: UILabel!
   
    static let reuseID = "AutorOfFeedCell" //String(describing: AutorOfFeedTableViewCell.self)
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
    func config(authorName: String, autorPhoto: String, dateOfPublication: Double) {
        self.autorName.text = authorName
        self.autorPhoto.sd_setImage(with: URL(string: autorPhoto))

        let dateFormater: DateFormatter = {
            let result = DateFormatter()
            result.dateFormat = "dd.MM.yyyy HH.mm"
            return result
        }()
        let date = Date(timeIntervalSince1970: dateOfPublication)
        let stringDate = dateFormater.string(from: date)
        self.dateOfPublication.text = stringDate
        
    }
}
