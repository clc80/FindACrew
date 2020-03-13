//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by Claudia Contreras on 3/12/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {

    // MARK: - IBOutlet
    @IBOutlet var searchBar: UISearchBar!
    
    // MARK: - Properties
    private var personController = PersonController()
    
    private var people: [Person] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonTableViewCell
        
        let person = people[indexPath.row]
        cell.person = person
        return cell
    }
}

extension PersonSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        personController.searchForPeopleWith(searchTerm: searchTerm) { (newPeople) in
            self.people = newPeople
        }
    }
}
