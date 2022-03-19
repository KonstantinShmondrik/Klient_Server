//
//  GroupsViewModelFactory.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 18.03.2022.
//

import UIKit
import SDWebImage

final class GroupsViewModelFactory {
    
    func consrtuctViewModels(from groups: [UsersGroupsDAO]) -> [GroupsViewModel] {
 
        return groups.compactMap(self.viewModel)
    }
    
    private func viewModel(from groups: UsersGroupsDAO) -> GroupsViewModel {
        
        let groupsName = groups.name
        let groupsLogoView = groups.photo200
        
        
        
        
        return GroupsViewModel(groupsName: groupsName, groupsLogoView: groupsLogoView)
    }
    
   
    
    
}
