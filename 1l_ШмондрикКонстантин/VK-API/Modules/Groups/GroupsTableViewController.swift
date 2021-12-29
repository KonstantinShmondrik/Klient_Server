//
//  GroupsTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//

import UIKit
import SDWebImage
import RealmSwift

final class GroupsTableViewController: UITableViewController {
   
    
    private var usersGroupAPI = UsersGroupsAPI()
    private var usersGroup: Results<UsersGroupsDAO>?
    private var usersGroupDB = UsersGroupsDB()
    private var token: NotificationToken?

    
    @IBOutlet weak var updateGroupsList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // TODO: - Временное решение, потом завязать на форму из прошлого курса
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") 

//        self.usersGroupDB.deleteUsersGroupsData(usersGroup!)
//        self.usersGroupDB.deleteAllUsersGroupsData()
        // MARK: - вызов групп пользователя
        usersGroupAPI.getUsersGroups2 { [weak self] usersGroup in
            guard let self = self else {return}
//            self.usersGroup = usersGroup
//            self.usersGroupDB.deleteAllUsersGroupsData()
            self.usersGroupDB.deleteUsersGroupsData(usersGroup)
            self.usersGroupDB.saveUsersGroupsData(usersGroup)
            self.usersGroup = self.usersGroupDB.fetchUsersGroupsData()
            
//            self.tableView.reloadData()
            self.token = self.usersGroup?.observe(on: .main, { [weak self] changes in
                
                guard let self = self else { return }
                
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                    
                case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.endUpdates()
                    
                case .error(let error):
                    print("\(error)")
                }

            })
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let usersGroup = usersGroup else { return 0 }

        return usersGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let group = usersGroup?[indexPath.row]
        cell.textLabel?.text = "\(group?.name ?? "")" 
        
        if let url = URL(string: group?.photo100 ?? "") {

            cell.imageView?.sd_setImage(with: url, completed: { image, _, _, _ in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
        }

        return cell
    }
    

    @IBAction func updateGroupsList(_ sender: Any) {
        usersGroupAPI.getUsersGroups2 { [weak self] usersGroup in
            guard let self = self else {return}
            self.usersGroupDB.deleteUsersGroupsData(usersGroup)
            self.usersGroupDB.saveUsersGroupsData(usersGroup)
            self.usersGroup = self.usersGroupDB.fetchUsersGroupsData()
            print("данные обновлены")
            self.tableView.reloadData()
        }
    }
    
}
