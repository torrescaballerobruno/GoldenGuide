//
//  ServiceServices.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 05/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

let serviceServices = ServiceServices()

class ServiceServices{
    
    private let collection: String = "service"
    private var getRef: Firestore!
    private var ref: DocumentReference?

    init(){
        getRef = Firestore.firestore()
    }

    func getUser (username: String) -> Bool {
        var f = true
        getRef.collection(collection).document(username).getDocument { (document, error) in
            if let document = document, document.exists{
                self.ref = document.reference
            }else if let error = error {
                print(error.localizedDescription)
                f = false
            }
        }
        return f
    }
    
    func createService(service: Service,image: UIImage){
        
        ref = getRef.collection(collection).addDocument(data: service.toMap(), completion: {(error) in
            if let error = error{
                print(error.localizedDescription)
            }
        })
        if let imageOptimizada = image.jpegData(compressionQuality: 0.6){
            uploadImage(imageData: imageOptimizada)
        }
    }
    
    func uploadImage(imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .medium)
        activityIndicator.startAnimating()
        
        let storageReference = Storage.storage().reference()
        guard let ref  = ref else { return }
        let userImageRef = storageReference.child("/photos").child(ref.documentID)
        let uploadMetadata = StorageMetadata()
        
        uploadMetadata.contentType = "image/jpeg"
        
        userImageRef.putData(imageData, metadata: uploadMetadata){
            (storageMetadata,error) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            if let error = error {
                print(error.localizedDescription)
            }else{
                print("metadata: ", storageMetadata?.path)
            }
        }
    }
    
    func getAllServices()->[Service]{
        var services = [Service]()
        getRef.collection(collection).getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                for document in querySnapshot!.documents {
                    let id = document.documentID
                    let values = document.data()

                    let description = values["description"] as? String ?? "sin valor"
                    let price = values["price"] as? String ?? "sin precio"
                    let rating = values["rating"] as? String ?? "sin valor"
                    let hirings = values["hirings"] as? String ?? "sin precio"
                    let title = values["title"] as? String ?? ""
                    let category = values["category"] as? Category ?? Category(id: nil, type: "Default")

                    services.append(Service(id: id, title: title, description: description, price: Double(price)!, category: category, rating: Int(rating)!, picture: nil, hirings: Int(hirings)!, comments: nil))

                }
            }
        }
        return services
    }
}
