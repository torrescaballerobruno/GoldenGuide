//
//  Comment.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation

struct Comment: Mapper{
    
    var user: User
    var description: String
    var rating: Int
    
    func toMap() -> [String : Any] {
        let data: [String: Any] = ["user" : user.toMap(),
                                   "description": self.description,
                                   "rating": self.rating]
        return data
    }
}
