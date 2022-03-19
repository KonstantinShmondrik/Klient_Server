//
//  TextOfFeedTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit

class TextOfFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsText: UILabel!
    
    static let reuseID = "TextOfFeedCell"
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    func config(textOfFeed: String) {
        self.newsText.text = textOfFeed
        
    }
   
    
}
