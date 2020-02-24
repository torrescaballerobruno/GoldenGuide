//
//  User.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation
import UIKit

struct ServerUser : Mapper{
    var username: String
    var name: String
    var lastname: String
    var age: Int
    var address: Address
    var phone: String
    var userImage: String?
    var services: [Service]
    var rating: Int
    
    func toMap() -> [String : Any] {
        let data: [String: Any] = ["username": username,
                                   "name": name,
                                   "lastname": lastname,
                                   "age": age,
                                   "address": address.toMap(),
                                   "phone": phone,
                                   "userImage": userImage as Any,
                                   "rating": rating]
        return data
    }
}
