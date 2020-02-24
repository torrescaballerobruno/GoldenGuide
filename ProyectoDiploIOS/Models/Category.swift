//
//  Category.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 23/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import Foundation

struct Category: Mapper{

    var id: String?
    var type: String

    func toMap() -> [String : Any] {
        let data: [String: Any] = ["id": id as Any,
                                   "type": type]
        return data
    }

}
