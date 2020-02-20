//
//  ViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 04/12/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! LoginViewController
        if segue.identifier == "user" {
            destination.isUser = true
            destination.nameImage = "account"
        }else{
            destination.isUser = false
//            destination.imageView.image = UIImage(named: "account")
            destination.nameImage = "comercio"
        }
    }

}

