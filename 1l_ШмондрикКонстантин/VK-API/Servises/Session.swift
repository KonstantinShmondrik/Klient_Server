//
//  File.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 09.12.2021.
//

import Foundation

// Хранение данных о текущей сессии
class Session {
    static let shared = Session()
    
    private init() {}
    
    var token = ""                  // токен в VK
    var userId = ""                 // ID пользователя
    let version = "5.131"           // версия VK API
}
