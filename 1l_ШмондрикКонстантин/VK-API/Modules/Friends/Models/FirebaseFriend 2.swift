//
//  FirebaseFriend.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 16.01.2022.
//

import Foundation
import Firebase

class FirebaseFriend {
    
    let userID: String
    let ref: DatabaseReference?
    
    init (userID: String){
        self.ref = nil
        self.userID = userID
    }
    
    init?(snapsht: DataSnapshot) {
        guard
            let value = snapsht.value as? [String: Any],
            let userID = value["userID"] as? String else {
                return nil
            }
        self.ref = snapsht.ref
        self.userID = userID
    }
    func toAnyObject() -> [String: Any] {
        return [
            "userID": userID
        ]
    }
}
