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


class FirestoreRepository{

    static let shared = FirestoreRepository()

    private let collectionName: String = "users"
    private var db: Firestore!
    private var ref: DocumentReference? //is the current user

    init(){
        db = Firestore.firestore()
    }

    func addUser(user: User)-> Bool{
        var f = true
        db.collection(collectionName).document(user.userId).setData(toArray(user)) { error in
            if let error = error{
                debugPrint(error.localizedDescription)
                f = false
            }
        }
        return f
    }

    func getUser (username: String) -> Bool {
        var f = true
        db.collection(collectionName).document(username).getDocument { (document, error) in
            if let document = document, document.exists{
                self.ref = document.reference
            }else if let error = error {
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }


    func modifUser(user: User) -> Bool{
        var f: Bool = true
        guard let ref = ref else{return false}
        ref.updateData(toArray(user)) { (error) in
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
    

//    Auxiliary functions to convert from object to [String: Any]
    private func toArray(_ user: User) ->[String: Any]{
        let datos:[String: Any] = ["email": user.email,
                                   "name": user.name,
                                   "lastname": user.lastname,
                                   "age": user.age,
                                   "address": toArrayAddress(user.address),
                                   "phone": user.phone,
                                   "imageProfile": user.userImage as Any,
                                   "rating": user.rating as Any
                                ]
        return datos
    }

    private func toArrayAddress(_ address: Address) -> [String: Any]{
        let datos = ["city": address.city,
                     "state": address.state,
                     "neighborhood": address.neighborhood,
                     "zipcode": address.zipcode,
                     "street": address.street
                    ]
        return datos
    }
}
