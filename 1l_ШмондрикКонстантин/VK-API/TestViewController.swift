//
//  TestViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 12.12.2021.
//
// Тестовый контроллер для вызова в консоль JSON


import UIKit



class TestViewController: UITableViewController {
   private var friendsAPI = FriendsAPI()
   private var friends: [Friend] = []
    
    private var photosAPI = PhotosAPI()
    private var photos: [Photos] = []
    
    private var usersGroupAPI = UsersGroupsAPI()
    private var usersGroup: [UsersGroups] = []
    
    private var groupsSearchAPI = GroupsSearchAPI()
    private var groupsSearch: [GroupsSearch] = []
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

// MARK: -  вызов списка друзей
        
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else {return}
            self.friends = friends
            
            self.tableView.reloadData()
        }
// MARK: - вызов фотографий пользователя
        
        photosAPI.getPhotos { [weak self] photos in
            guard let self = self else {return}
            self.photos = photos
           
            self.tableView.reloadData()
        }
        
    
    
// MARK: - вызов групп пользователя
            
    usersGroupAPI.getUsersGroups { [weak self] usersGroup in
                guard let self = self else {return}
                self.usersGroup = usersGroup
           
                self.tableView.reloadData()
            }
            
// MARK: - получение групп по поисковому запросу
                
        groupsSearchAPI.groupsSearch { [weak self] groupsSearch in
                    guard let self = self else {return}
                    self.groupsSearch = groupsSearch
               
                    self.tableView.reloadData()
                }
        
    }

    
    
    
}
