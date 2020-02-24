//
//  FirestoreRepository.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 05/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class FirestoreRepositoryForUsers{

    static let shared = FirestoreRepositoryForUsers()

    private let collectionName: String = "users"
    private var db: Firestore!
    private var ref: DocumentReference? //is the current user

    var user: User?
    
    init(){
        db = Firestore.firestore()
    }

    func addUser(user: User)-> Bool{
        var f = true
        db.collection(collectionName).document(user.userId).setData(user.toMap()) { error in
            if let error = error{
                debugPrint(error.localizedDescription)
                f = false
            }
        }
        return f
    }

    func getUser (userId: String) -> User?{
        
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
   
            var user2 = User(userId: userId, email: email, name: name, lastname: lastname, age: age, address: Address(city: city, state: state, neighborhood: neighborhood, zipcode: zipcode, street: street), phone: phone, userImage: userImage, rating: rating)

            self.user = user2
        }
        return user
    }


    func modifUser(user: User) -> Bool{
        var f: Bool = true
        guard let ref = ref else{return false}
        ref.updateData(user.toMap()) { (error) in
            if let error = error{
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }

    func deleteUser(user: User) -> Bool{
        var f: Bool = true
        guard let ref = ref else{return false}
        ref.delete { (error) in
            if let error = error{
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }

}
