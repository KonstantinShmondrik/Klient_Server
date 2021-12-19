//
//  GroupsTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//

import UIKit
import SDWebImage

final class GroupsTableViewController: UITableViewController {
    
    private var usersGroupAPI = UsersGroupsAPI()
    private var usersGroup: [UsersGroups] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // TODO: - Временное решение, потом завязать на форму из прошлого курса
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") 

        // MARK: - вызов групп пользователя
        
        usersGroupAPI.getUsersGroups { [weak self] usersGroup in
            guard let self = self else {return}
            self.usersGroup = usersGroup
            
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
        return usersGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let group: UsersGroups = usersGroup[indexPath.row]
        cell.textLabel?.text = "\(group.name)"
        
        if let url = URL(string: group.photo100) {
            cell.imageView?.sd_setImage(with: url, completed: nil)
        }

        return cell
    }
    

   
}
