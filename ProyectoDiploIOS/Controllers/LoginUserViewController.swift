//
//  LoginUserViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 06/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit
import Firebase

class LoginUserViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        isLoged()
    }


    @IBAction func login(_ sender: UIButton) {

        guard let email = userEmail.text, email != "", let password = userPass.text, password != "" else {
            present(AlertsCreator(title: "Error", message: "No puedes dejar vacio el campo de email o password").createAlert(), animated: true)
            return
        }

//        Esto hay que ponerlo en otro archivo
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
                self.present(AlertsCreator(title: "Error", message: "Email o password incorrectos").createAlert(), animated: true)
                return
            }
            print("usuario autenticado")
            let viewController = UIStoryboard(name: "UserViews", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }

    @IBAction func register(_ sender: UIButton) {
        let registerView = RegisterUsersViewController()
        present(registerView, animated: true)
    }

    func isLoged(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil{
                print("Usuario no logeado")
            }else{
                print("Usuario logeado")
                print(Auth.auth().currentUser!)
//                self.performSegue(withIdentifier: "test", sender: self)
                let viewController = UIStoryboard(name: "UserViews", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }

}
