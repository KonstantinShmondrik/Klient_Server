//
//  Dictionaris.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 17.11.2021.
//

// Структуры для словарей

import Foundation
import UIKit

struct DictionaryPage{
    
    let firstLater: String
    let list: [Users]
    
}

struct NewsPage{
    let newsText: String
    let newsPhoto: String
    let user: Users
}
