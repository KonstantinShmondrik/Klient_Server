//
//  CustomPushTwistAnimation.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 03.12.2021.
//

import Foundation
import UIKit

class CustomPushTwistAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    var duration = 0.6
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
      
        guard let source = transitionContext.viewController(forKey: .from) else {return}
        guard let destination = transitionContext.viewController(forKey: .to) else {return}
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewFrame = CGRect(
            x: -containerViewFrame.width,
            y: -containerViewFrame.width,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        
        let destinationViewFrame = source.view.frame 
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.transform = CGAffineTransform(rotationAngle: -(.pi/2))
        destination.view.frame = CGRect(
            x: containerViewFrame.width,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        
        
        UIView.animate(
            withDuration: duration,
            animations: {
                source.view.transform = CGAffineTransform(rotationAngle: .pi/2) // если выключить эти две строчки, предыдущая вью не повернется (переход назад будет не корректным)
                source.view.frame = sourceViewFrame                             //
                destination.view.transform = .identity
                destination.view.frame = destinationViewFrame
        })
        { finished in

            transitionContext.completeTransition(finished)
        }
        
//        {finished in
//            if finished && !transitionContext.transitionWasCancelled {
//
//                source.view.transform = .identity
//
//                source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
//            }
//            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
//        }
        
    }

}

