//
//  FriendsPhotoSecondViewController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 28.11.2021.
//

import UIKit

class FriendsPhotoSecondViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let photos = [
                 UIImage(named: "01")!,
                 UIImage(named: "02")!,
                 UIImage(named: "03")!,
                 UIImage(named: "04")!,
                 UIImage(named: "05")!,
                 UIImage(named: "06")!
                 ]
   
    var i: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoImageView.image = self.photos[0]
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_: )))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_: )))
//        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_ : )))
        
        
        
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(rightSwipe)
        self.view.addGestureRecognizer(leftSwipe)

        
    }
    
    func swipingLeft(){        // модифицируем анимации
        if i < self.photos.count - 1 {
        i += 1
    UIView.transition(with: self.photoImageView,
                      duration: 1,
                      options: .transitionCrossDissolve,
                      animations: { [self] in
        self.photoImageView.image = self.photos[i]
    })
 
            UIView.animate(withDuration: 0.5,
                           animations: {
                self.photoImageView.center.x = -self.view.bounds.width*2
            })
        }
        else{
            self.photoImageView.image = self.photos[self.photos.count-1]
            self.photoImageView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
            let animator = UIViewPropertyAnimator(duration: 0.5,
                                                  dampingRatio: 0.5,
                                                  animations: {
                self.photoImageView.transform = .identity
            })
            animator.startAnimation()
        }
    }
    
    func swipingRight() {    // модифицируем анимации
        if i > 0 {
        i -= 1
        UIView.transition(with: self.photoImageView,
                          duration: 1,
                          options: .transitionCrossDissolve,
                          animations: { [self] in
            self.photoImageView.image = self.photos[i]
        })
            UIView.animate(withDuration: 0.5,
  
                           animations: {
                self.photoImageView.center.x = self.view.bounds.width*2
            }
                           )
            
        } else{
        self.photoImageView.image = self.photos[0]
        self.photoImageView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
            let animator = UIViewPropertyAnimator(duration: 0.5,
                                                  dampingRatio: 0.5,
                                                  animations: {
                self.photoImageView.transform = .identity
            })
            animator.startAnimation()
        }
    }
    
    @objc func swipeRight(_ swipe: UISwipeGestureRecognizer) {
       
            swipingRight()
      
        
        
    }
    
    @objc func swipeLeft(_ swipe: UISwipeGestureRecognizer) {
        swipingLeft()
      
    }
    
    

}
