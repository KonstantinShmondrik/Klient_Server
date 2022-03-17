///
//  LoadingViewController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 20.11.2021.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingBackgraundView: UIView! {
        didSet{
            
            self.loadingBackgraundView.clipsToBounds = true
            self.loadingBackgraundView.layer.cornerRadius = loadingBackgraundView.frame.height / 2
            self.loadingBackgraundView.layer.shadowColor = UIColor.black.cgColor
            self.loadingBackgraundView.layer.shadowRadius = 8
            self.loadingBackgraundView.layer.shadowOffset = CGSize.zero
            self.loadingBackgraundView.layer.shadowOpacity = 0.5
           
        }
    }
    @IBOutlet weak var loadingPointView_1: UIView! {
        didSet{
            
            self.loadingPointView_1.clipsToBounds = true
            self.loadingPointView_1.layer.cornerRadius = loadingPointView_1.frame.height / 2
        }
    }
    @IBOutlet weak var loadingPointView_2: UIView! {
        didSet{
            
            self.loadingPointView_2.clipsToBounds = true
            self.loadingPointView_2.layer.cornerRadius = loadingPointView_2.frame.height / 2
        }
    }
    @IBOutlet weak var loadingPointView_3: UIView! {
        didSet{
            
            self.loadingPointView_3.clipsToBounds = true
            self.loadingPointView_3.layer.cornerRadius = loadingPointView_3.frame.height / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadingAnimations()
       
    }

    
    func loadingAnimations(){
        
        let animationSpeed = 1.0
        
        UIView.animate(withDuration: animationSpeed,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loadingPointView_1.alpha = 0
            
        })
        UIView.animate(withDuration: animationSpeed,
                       delay: animationSpeed / 3,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loadingPointView_2.alpha = 0
        })
        UIView.animate(withDuration: animationSpeed,
                       delay: animationSpeed / 3 * 2,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loadingPointView_3.alpha = 0
        })
    }
}
