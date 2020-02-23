//
//  User.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import UIKit


struct User: Mapper{

    var userId: String
    var email: String
    var password: String
    var name: String
    var lastname: String
    var age: Int
    var address: Address
    var phone: String
    var userImage: String?
    var rating: Int?
    
    func toMap() -> [String : Any] {
        let data: [String: Any] = ["userId": userId,
                                   "email": email,
                                   "password":password,
                                   "name":name,
                                   "lastname": lastname,
                                   "age": age,
                                   "address":address.toMap(),
                                   "phone": phone,
                                   "userImage": userImage,
                                   "rating": rating]
        return data
    }
}
