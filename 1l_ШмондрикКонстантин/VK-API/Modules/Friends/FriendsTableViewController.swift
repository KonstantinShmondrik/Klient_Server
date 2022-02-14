//
//  FriendsTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 18.12.2021.
//

import UIKit
import SDWebImage
import RealmSwift
import Firebase


final class FriendsTableViewController: UITableViewController {
   
    
    private var friendsAPI = FriendsAPI()
    var friends2: [Friend] = []
    private var friends: Results<FriendDAO>?
    private var friendsDB = FriendsDB()
    private var token: NotificationToken?
    private let authService = Auth.auth()
    private var users = [FirebaseFriend]()
    private let ref = Database.database().reference(withPath: "users")
    var photoService = PhotoService(container: UITableViewController())
    let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
  
    let documentsDirectory = NSHomeDirectory()
 
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged) // обновление списка
        
        callingFriendsList()
        
        setUserToFierbase()
        
        print("ПУТЬ К КЭШУ \(documentsDirectory)")
  
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      /*  guard let friends = friends else { return 0 }
        
        return friends.count
       */
        return friends2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
        /*
        let friend = friends?[indexPath.row]
        cell.namesFriend?.text = "\(friend?.firstName ?? "") \(friend?.lastName ?? "")"
        
        if let url = URL(string: friend?.photo100 ?? "") {
            
            cell.friendsLogoImage?.sd_setImage(with: url, completed: { image, _, _, _ in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
        }
        */
        
        let friend = friends2[indexPath.row]
        cell.namesFriend.text = "\(friend.firstName) \(friend.lastName)"
        
        
        
        cell.friendsLogoImage.image = photoService.photo(atIndexpath: indexPath, byUrl: friend.photo50Url)
        
//        if let url = URL(string: friend.photo50) {
//
//            cell.friendsLogoImage?.sd_setImage(with: url, completed: { image, _, _, _ in
//                tableView.reloadRows(at: [indexPath], with: .automatic)
//            })
//        }
        print("URL ФОТО ДРУЗЕЙ \(URL(string: friend.photo50))")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFriendsPhotosCollectionViewController", let cell = (sender as? UITableViewCell) {
            guard let ctrl = segue.destination as? FriendsPhotosCollectionViewController else {return}
            if let indexPath = tableView.indexPath(for: cell) {
//                ctrl.userId = "\(String(describing: friends![indexPath.row].id) )"
                ctrl.userId = "\(String(describing: friends2[indexPath.row].id) )"
            }
        }
    }
    
 
    // MARK: - вызов информации об отсутствии интеренета
    func alertInternetConnection() {
        
        let alert = UIAlertController(title: "Нет соединения с интернетом",
                                      message: "",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - вызов списка друзей
    func callingFriendsList(){
        if NetworkState().isInternetAvailable {
            print("Internet Connection is ON")
          /*  friendsAPI.getFriends2 { [weak self] friends in
                guard let self = self else {return}
                self.friendsDB.deleteFriensdData(friends)
                self.friendsDB.saveFriensdData(friends)
                self.friends = self.friendsDB.fetchFriensdData()
                self.token = self.friends?.observe(on: .main, { [weak self] changes in
                    
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
            friendsViewDidLoadOperations()
            print("данные обновлены")
        } else {
            print("Internet Connection OFF")
          /*  self.friendsDB.fetchFriensdData() // Обновиться ли так список из базы?
            friendsAPI.getFriends2 { [weak self] friends in // нужно ли это?
                guard let self = self else {return}
                self.friends = self.friendsDB.fetchFriensdData()
                
                self.token = self.friends?.observe(on: .main, { [weak self] changes in
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
            self.alertInternetConnection()
        }
    }
    
    // MARK: - обновление списка
    @objc func refresh(sender:AnyObject) {
        callingFriendsList()
  
//        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    @IBAction func signOutAction(_ sender: Any) {
        try? authService.signOut()
        showLoginViewController()
        
    }
    
    private func showLoginViewController(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {return}
        guard let window = self.view.window else {return}
        window.rootViewController = vc
    }

    private func setUserToFierbase() {
        let usersID = friendsAPI.userId
        let userID = FirebaseFriend(userID: usersID)
        let userIDRef = self.ref.child(usersID.lowercased())
        userIDRef.setValue(userID.toAnyObject())
    
    }
   
// MARK: - Цепочка Operations
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
