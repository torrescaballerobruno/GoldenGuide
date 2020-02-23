//
//  Hiring.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import Foundation

struct Hiring : Mapper{
    var user: User
    var serverUSer: ServerUser
    var service: Service
    var finalPrice: Double
    var date: Date
    
    func toMap() -> [String : Any] {
        let data: [String: Any] = ["user": user.toMap(),
                                    "serverUser": serverUSer.toMap(),
                                    "service": service.toMap(),
                                    "finalPrice": finalPrice,
                                    "date": date]
        return data
    }
}
