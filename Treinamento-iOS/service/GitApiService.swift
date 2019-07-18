//
//  GitApiService.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol GitApiServiceDelegate {
    func success()
    func failure(error: String)
}

class GitApiService {
    
    var delegate: GitApiServiceDelegate!
    
    init(delegate: GitApiServiceDelegate) {
        self.delegate = delegate
    }
    
    func getRepositories(username: String) {
        
        GitApiRequestFactory.getRepositories(username: username).validate().responseArray {
            (response: DataResponse<[Repository]>) in
            
            switch response.result {
            
            case .success:
                if let repositories = response.result.value {
                    RepositoryViewModel.saveAll(objects: repositories, clear: true)
                }
                self.delegate.success()
                
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
}
