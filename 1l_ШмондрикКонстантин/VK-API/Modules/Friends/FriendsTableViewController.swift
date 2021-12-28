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
    private var friends: Results<FriendDAO>?
    private var friendsDB = FriendsDB()

    @IBOutlet weak var updateFriendsList: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //TODO: - Временное решение, потом завязать на форму из прошлого курса
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") 
        
// MARK: -  вызов списка друзей
        friendsAPI.getFriends2 { [weak self] friends in
            guard let self = self else {return}
            self.friendsDB.deleteAllFriensdData()
            self.friendsDB.saveFriensdData(friends)
            self.friends = self.friendsDB.fetchFriensdData()
           
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
        guard let friends = friends else { return 0 }

        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let friend = friends?[indexPath.row]
        cell.textLabel?.text = "\(friend!.firstName) \(friend!.lastName)"
        
        if let url = URL(string: friend?.photo100 ?? "") {
            cell.imageView?.sd_setImage(with: url, completed: nil)
        }

        return cell
    }
    
// MARK: - временная кнопка, заменить на жест "долгий свайп вниз"
    @IBAction func updateFriendsList(_ sender: Any) {
        
        friendsAPI.getFriends2 { [weak self] friends in
            guard let self = self else {return}
            self.friendsDB.deleteAllFriensdData()
            self.friendsDB.saveFriensdData(friends)
            self.friends = self.friendsDB.fetchFriensdData()
           print("данные обновлены")
            self.tableView.reloadData()
        }
        
    }
    
   

    



}
