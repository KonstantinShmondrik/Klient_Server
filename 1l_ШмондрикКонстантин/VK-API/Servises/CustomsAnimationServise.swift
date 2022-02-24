//
//  CustomsAnimationServise.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 22.02.2022.
//

import UIKit

class CustomsAnimationServise{
    
    func clickButton (button: UIButton) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 100
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 0.1
        animation.fillMode = CAMediaTimingFillMode.backwards
        button.layer.add(animation, forKey: nil)
    }
    
    
}
