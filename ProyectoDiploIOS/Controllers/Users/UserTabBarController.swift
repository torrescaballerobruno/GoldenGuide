//
//  UserTabBarController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 20/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import Firebase

class UserTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true 
    }
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        self.navigationController?.popViewController(animated: true)
    }

}
