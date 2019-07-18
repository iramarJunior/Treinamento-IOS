//
//  Repository.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Repository: Object, Mappable {
    
    @objc dynamic var name: String?
    @objc dynamic var language: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.name           <- map["name"]
        self.language       <- map["language"]
    }
}
