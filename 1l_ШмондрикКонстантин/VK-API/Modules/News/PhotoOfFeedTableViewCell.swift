//
//  PhotoOfFeedTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit

class PhotoOfFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var photoOfFeed: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(photoOfFeed: String){
        self.photoOfFeed.image = UIImage(named: photoOfFeed)
    }
}
