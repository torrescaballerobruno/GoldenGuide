//
//  Service.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

struct Service : Mapper {
    var id: String
    var title: String
    var description: String
    var price: Double
    var category: Category
    var rating: Int
    var picture: String?
    var hirings: Int
    var comments: [Comment]?
    
    func toMap() -> [String: Any]{
        let datos:[String: Any] = ["id": self.id,
                                   "title": self.title,
                                   "descripcion": self.description,
                                   "price": self.price,
                                   "category": self.category.toMap(),
                                   "rating": self.rating,
                                   "picture": self.picture!,
                                   "hirings": self.hirings]

        return datos
    }
    
    func load(_ image: @escaping (UIImage) -> Void){
        
        let userImageRef = Storage.storage().reference().child("/photos").child(id)
        var urlc: URL!
        
        userImageRef.downloadURL { (url, error) in
            if let error = error{
                print(error.localizedDescription)
                
                return
            }else{
                urlc = url!
            }
            /*if let img = ImageStore.cache.read(id) {
                print("Reading cache")
                image(img)
                return
            }*/
            DispatchQueue.global(qos: .background).async {
                if let data = try? Data(contentsOf: urlc), let img = UIImage(data: data) {
                    print("Loading from the internet")
                    //_ = ImageStore.cache.write(id, image: img)
                    DispatchQueue.main.async { image(img) }
                }
            }
        }
    }
}
