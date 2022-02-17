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
    @IBOutlet weak var autorPhoto: UIImageView!{
        didSet{
            self.autorPhoto.layer.borderColor = UIColor.gray.cgColor
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
    
    let dateFormater: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH.mm"
        return df
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(authorName: String, autorPhoto: String, dateOfPublication: Double) {
        self.autorName.text = authorName
        self.autorPhoto.sd_setImage(with: URL(string: autorPhoto))
//        self.autorPhoto.image = UIImage(named: autorPhoto)
        let data = Date(timeIntervalSince1970: dateOfPublication)
        let stringDate = dateFormater.string(from: data)
        self.dateOfPublication.text = stringDate
        
    }
}
