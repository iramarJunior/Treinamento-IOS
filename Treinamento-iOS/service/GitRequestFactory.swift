//
//  GitRequestFactory.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire

class GitApiRequestFactory {
    
    static func getRepositories(username: String) -> DataRequest {
        
        return Alamofire.request("https://api.github.com/users/\(username)/repos", method: .get)
    }
}
