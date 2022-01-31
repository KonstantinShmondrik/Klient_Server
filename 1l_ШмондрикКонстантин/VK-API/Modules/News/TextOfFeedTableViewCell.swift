//
//  TextOfFeedTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit

class TextOfFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func config(textOfFeed: String){
        self.newsText.text = textOfFeed
        
    }
    
}
