//
//  Address.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation

struct Address : Mapper{
    
    var city: String
    var state: String
    var neighborhood: String
    var zipcode: String
    var street: String

    func toMap() -> [String : Any] {
        let data: [String: Any] = ["city": self.city,
                                  "state": self.state,
                                  "neighborhood": self.neighborhood,
                                  "zipcode": self.zipcode,
                                  "street": self.street]
        return data
    }
}

//extension Address{
//    init?(dictionary: [String : Any]) {
//        guard   let name = dictionary["name"] as? String,
//            let done = dictionary["done"] as? Bool
//            else { return nil }
//         
//        self.init(name: name, done: done, id: id)
//    }
//}
