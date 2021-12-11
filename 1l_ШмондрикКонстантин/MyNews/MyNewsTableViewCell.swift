//
//  MyNewsTableViewCell.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 21.11.2021.
//

import UIKit

class MyNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsPhoto: UIImageView!
    @IBOutlet weak var newsText: UILabel!{
        didSet{
            self.newsText.numberOfLines = 0
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

    // MARK: helpers functions
    
    func configurate(newsText: String, newsPhoto: String) {
        self.newsText.text = newsText
        self.newsPhoto.image = UIImage(named: newsPhoto)
        self.backgroundColor = .clear
       
    }
   
}
