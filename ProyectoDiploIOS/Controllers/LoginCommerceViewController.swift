//
//  LoginCommerceViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 20/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import Firebase

class LoginCommerceViewController: UIViewController {

    @IBOutlet weak var commerceEmail: UITextField!
    @IBOutlet weak var commercePass: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        isLoged()
    }

    @IBAction func loginCommerce(_ sender: UIButton) {
//        if let usr = user.text, let pwd = password.text{
//            let user = User(username: usr,password: pwd, name: "Bruno", lastname: "Torres", age: 23, address: nil, phone: "12345", userImage: nil, rating: 5)
//        }

        guard let email = commerceEmail.text, email != "", let password = commercePass.text, password != "" else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("usuario autenticado")

        }
    }

    @IBAction func registerCommerce(_ sender: UIButton) {
        
    }


    func isLoged(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil{
                print("Usuario no logeado")
            }else{
                print("Usuario logeado")
                print(Auth.auth().currentUser!)
//                self.performSegue(withIdentifier: "listView", sender: self)
            }
        }
    }

}
