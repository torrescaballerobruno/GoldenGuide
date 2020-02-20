//
//  AlertsCreator.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 19/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

struct AlertsCreator {
    var title: String
    var message: String
    
    func createAlert() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(actionAlert)
        
        return alert
    }
}
