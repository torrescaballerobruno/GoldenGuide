//
//  ListServicesViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 20/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class ListServicesViewController: UIViewController {
    
    @IBOutlet weak var tableViewCategories: UITableView!
    let companyTypes = ["Veterinario", "Carpintero", "Plomero"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewCategories.delegate = self
        tableViewCategories.dataSource = self
    }

}

extension ListServicesViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = companyTypes[indexPath.row]
        
        return cell
    }
    
    
}
