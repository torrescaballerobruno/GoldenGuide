//
//  CategoryService.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 23/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

let categoryService = CategoryService()

class CategoryService{
    private let collection: String = "category"
    private var getRef: Firestore!
    private var ref: DocumentReference?

    init(){
        getRef = Firestore.firestore()
    }
    
    func createCategory(category: Category, success: @escaping ((Error?) -> Void) ){
        ref = getRef.collection(collection).addDocument(data: category.toMap(), completion: success)
    }
    
    func getCategories(complete: @escaping ([Category], _ error: Error?)->Void){
        var categories = [Category]()
            self.getRef.collection(self.collection).getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                for document in querySnapshot!.documents {
                    let id = document.documentID
                    let values = document.data()

                    let type = values["type"] as? String ?? "sin valor"
                    categories.append(Category(id: id, type: type))
                }
            }
            complete(categories,error)
        }
    }
}
