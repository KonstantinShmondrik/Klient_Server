//
//  AvailableGroupsController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 05.11.2021.
//

import UIKit

class AvailableGroupsController: UITableViewController {

    var groups = GroupsArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups.groupBlock.sort()

        // для скрытия клавиатуры
//        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        tableView.addGestureRecognizer(hideKeyboardGesture)
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.groupBlock.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? AvailableGroupsCell else {return UITableViewCell()}

        let group = groups.groupBlock[indexPath.row]
        cell.configurate(groupName: group.name, groupPicture: group.logo )

        return cell
    }
    
    
    /* // механизм скрытия клавиатуры ломает механизм добавления групп в "мои группы"
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc func keyboardWasShown (notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.tableView.contentInset = contentInsets
       tableView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        self.tableView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        
        self.tableView.endEditing(true)
    }
*/
    
    
    
}
