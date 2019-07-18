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
    @IBOutlet weak var tableView: UITableView!
    
    var service: GitApiService!
    
    var repositoriesView: [RepositoryView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = GitApiService(delegate: self)
        self.setupTableView()
    }
    
    func setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(cellType: RepositoryTableViewCell.self)
    }
    
    @IBAction func send(_ sender: Any) {
        self.service.getRepositories(username: self.username.text ?? "")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.repositoriesView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RepositoryTableViewCell
        
        cell.bind(repository: self.repositoriesView[indexPath.row])
        
        return cell
    }
}

extension ViewController: GitApiServiceDelegate {
    
    func success() {
        self.repositoriesView = RepositoryViewModel.getAll()
        self.tableView.reloadData()
    }
    
    func failure(error: String) {
        print(error)
    }
}
