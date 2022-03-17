//
//  PhotoOfFeedTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit
import SDWebImage

class PhotoOfFeedTableViewCell: UITableViewCell {
   
    @IBOutlet weak var photoOfFeed: UIImageView!
   
    static let reuseID = "PhotoOfFeedCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
     
    }
    
    func config(photoOfFeed: String){
        self.photoOfFeed.sd_setImage(with: URL(string:photoOfFeed))
    }
}
