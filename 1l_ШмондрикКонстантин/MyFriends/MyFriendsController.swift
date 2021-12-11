//
//  MyFriendsController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 05.11.2021.
//

import UIKit



class MyFriendsController: UITableViewController {

    
    var friends = UserFriendArry()

    
    
    // пока что такой "костылек". Позже реализую метод, который будет собирать справочник по первой букве имени
    private var dictionaries = [
                         DictionaryPage(firstLater: "З",
                                        list: [Users(name: "Зог", logo: "Zog")]),
                         DictionaryPage(firstLater: "Л",
                                        list: [Users(name: "Люцик", logo: "Lucy")]),
                         DictionaryPage(firstLater: "Т",
                                        list: [Users(name: "Тиабини", logo: "Tiabiny")]),
                         DictionaryPage(firstLater: "У",
                                        list: [Users(name: "Уна", logo: "Una")]),
                         DictionaryPage(firstLater: "Э",
                                        list: [Users(name: "Эльфо", logo: "Elfo"),]),
                         ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends.usersBlock.sort()
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.dictionaries.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  self.dictionaries[section].list.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dictionaries[section].firstLater
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as?  UITableViewHeaderFooterView else {return }
        
        header.tintColor = UIColor.systemBlue.withAlphaComponent(0.5)
        header.textLabel?.font = UIFont(name: "Helveica-Regular", size: 20)
       
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendCell", for: indexPath) as? MyFriendsCell else { return UITableViewCell() }
        
        
//        let friend = friends.usersBlock[indexPath.row] // предыдущая реализация
        let friend = self.dictionaries[indexPath.section].list[indexPath.row]

        cell.configurate(friendName: friend.name, avatarLogo: friend.logo )
        
        return cell
    }
   
////   анимация при нажатии на ячейку
//    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? MyFriendsCell else {return}
//
//        cell.logoAnimait()
//
//        }

    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("I was selected")
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// let cell = sender as! MyFriendsCell
//
//let friendsPhoto = segue.destination as! FriendsPhotoViewController
//
//        friendsPhoto
//
//    }
    
    
//    
//    var nameDictionary: Dictionary<String, Array<String>> = [:]
//
//    for friends.usersBlock.name in friends {
//        var key = name[0].uppercaseString // first letter of the name is the key
//        if let arrayForLetter = nameDictionary[key] { // if the key already exists
//            arrayForLetter.append(name) // we update the value
//            nameDictionary.updateValue(arrayForLetter, forKey: key) // and we pass it to the dictionary
//        } else { // if the key doesn't already exists in our dictionary
//            nameDictionary.updateValue([name], forKey: key) // we create an array with the name and add it to the dictionary
//        }
//    }
//    
    
    
    // Вспомогательная функция для сортировки по разделам по первой букве
   
    /*
    
    private func alphabetizeArray(array: [String]) -> [String: [String]] {
        var result = [String: [String]]()
         
        for item in array {
//            let index1 = item.startIndex.advanced(by: 1)
            let index = item.startIndex.advanced(by: 1)
//            let firstLetter = item.substringToIndex(index).uppercaseString
            let firstLetter = item.substring(to: index).uppercased()
            if result[firstLetter] != nil {
                result[firstLetter]!.append(item)
            } else {
                result[firstLetter] = [item]
            }
        }
         
        for (key, value) in result {
            result[key] = value.sort( by: { (a, b) -> Bool in
                a.lowercase < b.lowercase(
            })
        }
         
        return result
    }

    */
    
}
