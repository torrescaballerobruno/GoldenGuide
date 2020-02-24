//
//  Service.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import UIKit

struct Service : Mapper {
    var id: String
    var title: String
    var description: String
    var price: Double
    var category: String
    var rating: Int
    var picture: String?
    var hirings: Int
    var comments: [Comment]?
    
    
    func toMap() -> [String: Any]{
        let datos:[String: Any] = ["id": self.id,
                                   "title": self.title,
                                   "descripcion": self.description,
                                   "price": self.price,
                                   "category": self.category,
                                   "rating": self.rating,
                                   "picture": self.picture,
                                   "hirings": self.hirings]

        return datos
    }
    
    /*func load(_ image: @escaping (UIImage) -> Void) {
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        let filename = CheckSum.sha256String(urlString)!
        if let img = ImageStore.cache.read(filename) {
            print("Reading cache")
            image(img)
            return
        }
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                print("Loading from the internet")
                _ = ImageStore.cache.write(filename, image: img)
                DispatchQueue.main.async { image(img) }
            }
        }
    }*/
}
