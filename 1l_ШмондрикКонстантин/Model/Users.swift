//
//  Users.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 14.11.2021.
//

import Foundation
import UIKit

class Users {
    
    var name: String
    var logo: String
    init(name: String, logo: String){
    self.name = name
    self.logo = logo
    }
    
}
    
    extension Users: Comparable{
        static func == (lhs: Users, rhs: Users) -> Bool {
            return lhs.name == rhs.name
        }
        static func < (lhs: Users, rhs: Users) -> Bool{
            return lhs.name < rhs.name
        }
    }

