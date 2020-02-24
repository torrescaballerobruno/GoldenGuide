//
//  UserProfileViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 21/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import FirebaseFirestore

class UserProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    private let collectionName: String = "users"
    private var db: Firestore!
    
    var user: User?{
        didSet{
            nameLabel.text = user?.name
            phoneLabel.text = user?.phone
            emailLabel.text = user?.email
            if let imageUser = user?.userImage{
                imageProfile.image = imageConvert.shared.convertBase64StringToImage(imageBase64String: imageUser)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        db = Firestore.firestore()
        
        if let userId = KeychainManager.shared.retrieveData(key: "userId"){
            getUser(userId: userId)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! EditProfileViewController
        destination.user = self.user
    }
    
    func initialSetup(){
        nameLabel.layer.borderWidth = 0.5
        nameLabel.layer.cornerRadius = 8
        phoneLabel.layer.borderWidth = 0.5
        phoneLabel.layer.cornerRadius = 8
        emailLabel.layer.borderWidth = 0.5
        emailLabel.layer.cornerRadius = 8
    }
    
    func getUser (userId: String){
            
    //        db.collection(collectionName).document(userId).getDocument{ (snapshot, error) in
            db.collection(collectionName).document(userId).addSnapshotListener { (snapshot, error) in
                if let error = error{
                    debugPrint(error.localizedDescription)
                    return
                }
                guard let data = snapshot?.data(),
                    let userId = data["userId"] as? String,
                    let email = data["email"] as? String,
                    let name = data["name"] as? String,
                    let lastname = data["lastname"] as? String,
                    let age = data["age"] as? Int,
                    let address = data["address"] as? [String: Any],
                    let city = address["city"] as? String,
                    let neighborhood = address["neighborhood"] as? String,
                    let state = address["state"] as? String,
                    let street = address["street"] as? String,
                    let zipcode = address["zipcode"] as? String,
                    let phone = data["phone"] as? String
                    else { return }
                
                let userImage = data["userImage"] as? String
                let rating = data["rating"] as? Int
       
                self.user = User(userId: userId, email: email, name: name, lastname: lastname, age: age, address: Address(city: city, state: state, neighborhood: neighborhood, zipcode: zipcode, street: street), phone: phone, userImage: userImage, rating: rating)
            }
        }
}
