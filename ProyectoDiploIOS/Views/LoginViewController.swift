//
//  LoginViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 06/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func login(_ sender: UIButton) {
        if let usr = user.text, let pwd = password.text{
            let user = User(username: usr,password: pwd, name: "Bruno", lastname: "Torres", age: 23, address: nil, phone: "12345", userImage: nil, rating: 5)
            print(user)
            print(userServices.addUser(user: user))
        }
        print("Iniciar sesion")
    }
    
    
    @IBAction func register(_ sender: UIButton) {
        print("registro")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

