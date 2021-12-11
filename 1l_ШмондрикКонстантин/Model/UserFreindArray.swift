//
//  UserFreindArray.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 14.11.2021.
//

import Foundation
import UIKit

class UserFriendArry {
    
    var usersBlock = [Users]()
   
    func setupArray() {
     
        let user1 = Users(name: "Тиабини", logo: "Tiabiny")
        let user2 = Users(name: "Эльфо", logo: "Elfo")
        let user3 = Users(name: "Люцик", logo: "Lucy")
        let user4 = Users(name: "Зог", logo: "Zog")
        let user5 = Users(name: "Уна", logo: "Una")
        
        usersBlock.append(user1)
        usersBlock.append(user2)
        usersBlock.append(user3)
        usersBlock.append(user4)
        usersBlock.append(user5)
        
    }
    
    init() {
        setupArray()
    }
}
