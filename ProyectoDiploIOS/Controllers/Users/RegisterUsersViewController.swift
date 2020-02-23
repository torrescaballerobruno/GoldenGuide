//
//  RegisterUsersViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 19/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import Firebase

class RegisterUsersViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var neighborhoodTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          debugPrint ("Error signing out: %@", signOutError)
        }
    }

    @IBAction func register(_ sender: UIButton) {
        guard let name = nameTextField.text, name != "",
            let lastname = lastnameTextField.text, lastname != "",
            let email = emailTextField.text, email != "",
            let pass = passTextField.text, pass != "",
            let confirmPass = confirmPassTextField.text, confirmPass != "",
            let ageString = ageTextField.text, ageString != "", let age = Int(ageString),
            let phone = phoneTextField.text, phone != "",
            let city = cityTextField.text, city != "",
            let state = stateTextField.text, state != "",
            let neighborhood = neighborhoodTextField.text, neighborhood != "",
            let street = streetTextField.text, street != "",
            let zipcode = zipcodeTextField.text, zipcode != ""
        else{
            present(AlertsCreator(title: "Campos obligatorios", message: "No pueden dejarse vacios los campos").createAlert(), animated: true)
            return
        }
        
        if pass != confirmPass{
            present(AlertsCreator(title: "Error en confirmacion", message: "Las contraseñas no coinciden").createAlert(), animated: true)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: pass) { (authResult, error) in
            if let error = error{
                self.present(AlertsCreator(title: "Error al registrarse", message: error.localizedDescription).createAlert(), animated: true)
                return
            }
            
            let user = User(userId: authResult!.user.uid, email: email, password: pass, name: name, lastname: lastname, age: age, address: Address(city: city, state: state, neighborhood: neighborhood, zipcode: zipcode, street: street), phone: phone, userImage: nil, rating: nil)
            
            let successRegister = FirestoreRepository.shared.addUser(user: user)
            
            if successRegister{
                self.dismiss(animated: true, completion: nil)
            }else{
                self.present(AlertsCreator(title: "Error en Registro", message: "Hubo problemas para registrarse, por favor vuelva a intentar").createAlert(), animated: true)
            }
        }
    }

}
