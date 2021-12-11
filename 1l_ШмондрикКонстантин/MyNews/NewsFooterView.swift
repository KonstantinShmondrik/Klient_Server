//
//  NewsFooterView.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 22.11.2021.
//

import UIKit

class NewsFooterView: UITableViewCell {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    
    
    
    
    
    
    
    func transportationBtnLike(){
        UIView.transition(with: likeButton,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
        })
    }
    
    func clickCommentButton () {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 100
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.commentButton.layer.add(animation, forKey: nil)
        
    }
    func clickShareButton () {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 100
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
       
        self.shareButton.layer.add(animation, forKey: nil)
    }
    
    @IBAction func clickLikeButton(_ sender: Any) {
        transportationBtnLike()
       
        if likeButton.tag == 0 {           // пустое значение
            
            
            likeButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            likeButton.configuration?.baseForegroundColor = UIColor.red
            likeButton.setTitle("1", for: .normal)
            likeButton.setTitleColor(.red, for: .normal)
            likeButton.tag = 1

        } else {
            likeButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            likeButton.configuration?.baseForegroundColor = UIColor.gray
            likeButton.setTitle("0", for: .normal)
            likeButton.setTitleColor(.gray, for: .normal)
            likeButton.tag = 0
        }
    }
    @IBAction func clickCommentButton(_ sender: Any) {
        print("clickCommentButton")
      clickCommentButton()
    }
    @IBAction func clickShareButton(_ sender: Any) {
        print("clickShareButton")
        clickShareButton()
    }
    
    
}
