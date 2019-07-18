//
//  ViewController.swift
//  Treinamento-iOS
//
//  Created by Jobson Mateus on 12/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    var service: GitApiService!
    
    var repositoriesView: [RepositoryView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = GitApiService(delegate: self)
    }
    
    @IBAction func send(_ sender: Any) {
        self.service.getRepositories(username: self.username.text ?? "")
    }
}

extension ViewController: GitApiServiceDelegate {
    
    func success() {
        self.repositoriesView = RepositoryViewModel.getAll()
        
        for repository in self.repositoriesView {
            print("")
            print("name: \(repository.name)")
            print("language: \(repository.language)")
            print("")
        }
    }
    
    func failure(error: String) {
        print(error)
    }
}
