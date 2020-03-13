//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by Claudia Contreras on 3/12/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    // MARK: - Properties
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        genderLabel.text = person.gender
        yearLabel.text = person.birthYear
    }
}
