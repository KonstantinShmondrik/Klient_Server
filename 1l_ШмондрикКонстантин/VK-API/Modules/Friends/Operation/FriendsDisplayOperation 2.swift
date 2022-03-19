//
//  FriendsDisplayOperation.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 08.02.2022.
//

import Foundation

//MARK: вывод данных (список друзей)
class FriendsDisplayOperation: Operation{
    
    var friendsTableViewController: FriendsTableViewController
    
    override func main() {
        guard let parsedFriendsListData = dependencies.first as? FriendsParsingOperations,
              let friendsList = parsedFriendsListData.friedsList else {return}
        friendsTableViewController.friends2 = friendsList
        friendsTableViewController.tableView.reloadData()
        
    }
    
    init(controller: FriendsTableViewController) {
        self.friendsTableViewController = controller
    }
    
}
