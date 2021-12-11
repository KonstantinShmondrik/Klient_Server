//
//  Groups.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 15.11.2021.
//

import Foundation
import UIKit

class Groups {
    
    var name: String
    var logo: String
    init(name: String, logo: String){
    self.name = name
    self.logo = logo
    }
    
}
    
    extension Groups: Comparable{
        static func == (lhs: Groups, rhs: Groups) -> Bool {
            return lhs.name == rhs.name
        }
        static func < (lhs: Groups, rhs: Groups) -> Bool{
            return lhs.name < rhs.name
        }
    }

