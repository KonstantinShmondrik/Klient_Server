//
//  CustomTwistNavigationController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 03.12.2021.
//


import Foundation
import UIKit

class CustomTwistNavigationController: UINavigationController, UINavigationControllerDelegate{
    
    let interactiveTransition = CustomIneractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return CustomPushTwistAnimation()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return CustomPopTwistAnimation()
        }
        return nil
    }
    
    
}
