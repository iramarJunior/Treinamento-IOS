//
//  RepositoryViewModel.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct RepositoryView {
    var name = ""
    var language = ""
}

class RepositoryViewModel {
    
    static func save(object: Repository, clear: Bool = false) {
        
        if clear {
            self.deleteAll()
        }
        
        try? uiRealm.write {
            uiRealm.add(object, update: .error)
        }
    }
    
    static func saveAll(objects: [Repository], clear: Bool = false) {
        
        if clear {
            self.deleteAll()
        }
        
        try? uiRealm.write {
            uiRealm.add(objects, update: .error)
        }
    }
    
    static func get() -> [Repository] {
        let results = uiRealm.objects(Repository.self)
        
        var repositories : [Repository] = []
        repositories.append(contentsOf: results)
        
        return repositories
    }
    
    static func getAsView (repository: Repository?) -> RepositoryView {
        
        guard let repository = repository else {
            return RepositoryView()
        }
        
        var reposotoryView = RepositoryView()
        reposotoryView.name = repository.name ?? "-"
        reposotoryView.language = repository.language ?? "-"
        
        return reposotoryView
    }
    
    static func getAsView(repositories: [Repository]) -> [RepositoryView] {
        var repositoriesView: [RepositoryView] = []
        repositories.forEach { (repository) in
            repositoriesView.append(self.getAsView(repository: repository))
        }
        
        return repositoriesView
    }
    
    static func getAll() -> [RepositoryView] {
        return self.getAsView(repositories: self.get())
    }
    
    static func deleteAll() {
        
        let results = uiRealm.objects(Repository.self)
        
        try? uiRealm.write {
            
            uiRealm.delete(results)
        }
    }
}
