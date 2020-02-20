//
//  LoginViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 06/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPass: UITextField!
    
    var isUser: Bool!
    var nameImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isLoged()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = UIImage(named: nameImage)
    }


    @IBAction func login(_ sender: UIButton) {
//        if let usr = user.text, let pwd = password.text{
//            let user = User(username: usr,password: pwd, name: "Bruno", lastname: "Torres", age: 23, address: nil, phone: "12345", userImage: nil, rating: 5)
//        }

        guard let email = userEmail.text, email != "", let password = userPass.text, password != "" else {
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
    
    @IBAction func register(_ sender: UIButton) {
        if isUser{
            let register = RegisterUsersViewController()
            present(register, animated: true)
        }
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

