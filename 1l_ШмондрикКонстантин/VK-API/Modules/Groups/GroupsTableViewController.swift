//
//  GroupsTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//

import UIKit
import SDWebImage
import RealmSwift
import Firebase
import PromiseKit
//import FirebaseFirestore

final class GroupsTableViewController: UITableViewController {
    
    
    private var usersGroupAPI = UsersGroupsAPI()
    private var usersGroup: Results<UsersGroupsDAO>?
    private var usersGroupDB = UsersGroupsDB()
    private var token: NotificationToken?
    let usersGroupsPromiseService = UsersGroupsPromiseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged) // обновление списка
        
        callingGguopList()
        
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsTableViewCell else {return UITableViewCell()}
        
        let group = usersGroup?[indexPath.row]
        cell.groupsName?.text = "\(group?.name ?? "")"
        
        if let url = URL(string: group?.photo100 ?? "") {
            
            cell.groupsLogoImageView?.sd_setImage(with: url, completed: { image, _, _, _ in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
        }
        
        return cell
    }
    
    // MARK: - обновление списка
    @objc func refresh(sender:AnyObject) {
        
        callingGguopList()
        self.refreshControl?.endRefreshing()
    }
    
    private func callingGguopList() {
        
        // MARK: - вызов групп пользователя через Promise
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        firstly{
            usersGroupsPromiseService.getUsersGroups()
        } .get { [weak self] usersGroup in
            guard let self = self else {return}
            self.usersGroupsPromiseService.deleteUsersGroupsData(usersGroup)
            self.usersGroupsPromiseService.saveUsersGroupsData(usersGroup)
            self.usersGroup = self.usersGroupsPromiseService.fetchUsersGroupsData()
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
        } .catch{ error in
            print(error)
        } .finally {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }
    
    /*
     private func saveToFirestore(_ groups: Results<UsersGroupsDAO>? ){
     let database = Firestore.fierstore()
     let settings = database.settings
     settings.areTimestapsInSnapshotsEnabled = true
     database.settings = settings
     let groupsToSend = groups
     .reduce([:]) { $0.merging($1) {(current, _) in current }}
     database.collection("usersGroups").document(self.userID).setDate(groupsToSend, merge: true) { error in
     if let error = error {
     print(error.localizedDescription)
     } else {
     print("data saved")
     }
     }
     
     }
     
     */
    
    /*
     // MARK: - вызов групп пользователя (предыдущая реализация)
     usersGroupAPI.getUsersGroups2 { [weak self] usersGroup in
     guard let self = self else {return}
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
     
     
     */
    
}
