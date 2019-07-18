//
//  RepositoryTableViewCell.swift
//  Treinamento-iOS
//
//  Created by administrador on 18/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit
import Reusable

class RepositoryTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(repository: RepositoryView) {
        
        labelName.text = repository.name
        labelLanguage.text = repository.language
    }
}
