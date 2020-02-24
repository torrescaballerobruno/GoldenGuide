//
//  SevicesByCategoryCollectionViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 23/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import FirebaseFirestore

private let reuseIdentifier = "cellCollection"

class SevicesByCategoryCollectionViewController: UICollectionViewController {

    
    var services = [Service]()
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    
//    func getProducts(){
//    //        getRef.collection("productos").getDocuments { (querySnapshot, error) in
//            // Siempre tenemos en escucha los cambios de la db
//            getRef.collection("productos").addSnapshotListener({ (querySnapshot, error) in
//                if let error = error{
//                    print(error.localizedDescription)
//                    return
//                }else{
//                    self.productos = []
//                    for document in querySnapshot!.documents{
//                        let id = document.documentID
//                        let values = document.data()
//                        let nombre = values["nombre"] as? String ?? "sin valor"
//                        let precio = values["precio"] as? String ?? "sin precio"
//                        self.productos.append(Producto(nombre: nombre, precio: precio, id: id))
//                        
//                    }
//                self.tableView.reloadData()
//                }
//            })
//        }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
