//
//  File.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 09.12.2021.
//

import Foundation
import UIKit
// Хранение данных о текущей сессии
class Session {
    static let instance = Session()
    
    private init() {}
    
    var token: String = ""                  // токен в VK
    var userId: Int = 0                     // ID пользователя
}
