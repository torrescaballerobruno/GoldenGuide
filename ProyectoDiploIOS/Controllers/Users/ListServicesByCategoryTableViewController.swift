//
//  ListServicesByCategoryTableViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 24/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ListServicesByCategoryTableViewController: UITableViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var services = [Service]()
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        getServices()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return services.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ServiceTableViewCell

        cell.titleLabel.text = services[indexPath.row].title
        cell.descriptionTextView.text = services[indexPath.row].description
        cell.ratingLabel.text = String(services[indexPath.row].rating)
        return cell
    }
    
    
    func getServices(){
    
        db.collection("service").addSnapshotListener({ (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                self.services = []
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data()
                    let title = values["title"] as? String ?? "sin titulo"
                    let description = values["descripcion"] as? String ?? "sin descripcion"
                    let price = values["price"] as? Double ?? 0.0
                    let category = values["category"] as! [String : Any]
                    let idCategory = category["id"] as? String ?? "sin category id"
                    let typeCategory = category["type"] as? String ?? "sin nombre de categoria"
                    let rating = values["rating"] as? Int ?? 0
                    let hiring = values["hirings"]  as? Int ?? 0
                    self.services.append(Service(id: id, title: title, description: description, price: price,
                                                 category: Category(id: idCategory, type: typeCategory),
                                                 rating: rating, picture: nil, hirings: hiring, comments: nil))
                    
                }
            self.tableView.reloadData()
            }
        })
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
