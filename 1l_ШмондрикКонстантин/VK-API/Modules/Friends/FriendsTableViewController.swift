//
//  FriendsTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 18.12.2021.
//

import UIKit
import SDWebImage
import RealmSwift


final class FriendsTableViewController: UITableViewController {
    
    private var friendsAPI = FriendsAPI()
    private var friends: [FriendDAO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //TODO: - Временное решение, потом завязать на форму из прошлого курса
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") 
        
// MARK: -  вызов списка друзей
        friendsAPI.getFriends2 { [weak self] friends in
            guard let self = self else {return}
            self.friends = friends
            
            self.tableView.reloadData()
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let friend: FriendDAO = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        
        if let url = URL(string: friend.photo100) {
            cell.imageView?.sd_setImage(with: url, completed: nil)
        }

        return cell
    }
    

   
   

    



}
