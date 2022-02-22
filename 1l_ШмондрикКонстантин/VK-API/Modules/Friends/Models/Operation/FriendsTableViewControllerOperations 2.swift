//
//  File.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 08.02.2022.
//

import Foundation

final class FriendsTableViewControllerOperations: UITableViewController {
    
    func friendsViewDidLoadOperations(){
        
        let operationsQueue = OperationQueue()
        
        let friendsMakeAPIDataOperations = FriendsMakeAPIDataOperations()
        let friendsParsingOperations = FriendsParsingOperations()
        let friendsDisplayOperation = FriendsDisplayOperation(controller: self)
        
        operationsQueue.addOperation(friendsMakeAPIDataOperations)
        friendsParsingOperations.addDependency(friendsMakeAPIDataOperations)
        operationsQueue.addOperation(friendsParsingOperations)
        friendsDisplayOperation.addDependency(friendsParsingOperations)
        OperationQueue.main.addOperation(friendsDisplayOperation)
    }
}
