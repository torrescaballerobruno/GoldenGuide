//
//  RegisterViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit


class RegisterViewController : UIViewController{
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var password2TF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var neighborhoodTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var outdoorNumberTF: UITextField!
    @IBOutlet weak var interiorNumberTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    
    
    @IBAction func acceptBtn(_ sender: Any) {
        if let name = nameTF.text,
            let lastName = lastNameTF.text,
            let user = userTF.text,
            let pass1 = passwordTF.text,
            let pass2 = password2TF.text,
            let ageS = ageTF.text,
            let number = numberTF.text,
            let city = cityTF.text,
            let state = stateTF.text,
            let neighborhood = neighborhoodTF.text,
            let street = streetTF.text,
            let outdoorNumber = outdoorNumberTF.text,
            let zipCode = zipCodeTF.text{
            
            
            guard pass1 != pass2, let age = Int(ageS) else {
                return
                //Aqui va una alerta :v
            }
            
            let interiorNumber = interiorNumberTF.text ?? "0"
            let address = Address(city: city, state: state, neighborhood: neighborhood, zipcode: zipCode,
                                  street: street, outdoorNumber: outdoorNumber, interiorNumber: interiorNumber)

            let user = User(username: user, password: pass1, name: name, lastname: lastName, age: age, address: address, phone: number, userImage: nil, rating: nil)
            
            
            if userServices.addUser(user: user){
                print("Eso es tokio 😎")
            }else{
                print("Algo salio mal 😱")
            }
            
        }
    }
    
}
