//
//  GroupsArray.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 15.11.2021.
//

import Foundation
import UIKit

class GroupsArray {
    
    var groupBlock = [Groups]()
   
    func setupArray() {
     
        let group1 = Groups(name: "Чумная яма", logo: "Bar")
        let group2 = Groups(name: "Эльфуд", logo: "Elfud")
        let group3 = Groups(name: "Волшебный лес", logo: "Forest")
        let group4 = Groups(name: "Дримландя", logo: "Zog")
        let group5 = Groups(name: "Дэнкмайр", logo: "Una")
        
        groupBlock.append(group1)
        groupBlock.append(group2)
        groupBlock.append(group3)
        groupBlock.append(group4)
        groupBlock.append(group5)
        
    }
    
    init() {
        setupArray()
    }
}
