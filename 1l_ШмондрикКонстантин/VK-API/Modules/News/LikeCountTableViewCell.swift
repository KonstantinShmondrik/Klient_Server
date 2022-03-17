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
    static let reuseID = "LikeCountCell"
    let customAnimation = CustomsButtonAnimation()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    func config(LikeCount: Int, commentCount: Int, shareCount: Int, viewsCount: Int) {
        self.likeCount.setTitle(String(LikeCount), for: .normal)
        self.commentCount.setTitle(String(commentCount), for: .normal)
        self.shareCount.setTitle(String(shareCount), for: .normal)
        self.viewsCount.setTitle(String(viewsCount), for: .normal)
        
    }
    
    
    
    @IBAction func likeButtonAction(_ sender: Any) {
        customAnimation.clickButton(button: likeCount)
        print("likeButtonAction")
        if likeCount.tag == 0 {           // пустое значение
            
            
            likeCount.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            likeCount.configuration?.baseForegroundColor = UIColor.brandRed
//            likeCount.setTitle("1", for: .normal)
            likeCount.setTitleColor(.brandRed, for: .normal)
            likeCount.tag = 1

        } else {
            likeCount.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            likeCount.configuration?.baseForegroundColor = UIColor.brandGrey
//            likeCount.setTitle("0", for: .normal)
            likeCount.setTitleColor(.brandGrey, for: .normal)
            likeCount.tag = 0
        }
        
    }
    
    @IBAction func commentButtonAction(_ sender: Any) {
       
        customAnimation.clickButton(button: commentCount)
        print("commentButtonAction")
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        customAnimation.clickButton(button: shareCount)
        print("shareButtonAction")
    }
    
}
