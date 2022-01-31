//
//  LikeCountTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit

class LikeCountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likeCount: UIButton!
    @IBOutlet weak var commentCount: UIButton!
    @IBOutlet weak var shareCount: UIButton!
    @IBOutlet weak var viewsCount: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func config(LikeCount: Int, commentCount: Int, shareCount: Int, viewsCount: Int){
        self.likeCount.setTitle(String(LikeCount), for: .normal)
        self.commentCount.setTitle(String(commentCount), for: .normal)
        self.shareCount.setTitle(String(shareCount), for: .normal)
        self.viewsCount.setTitle(String(viewsCount), for: .normal)
        
    }
}
