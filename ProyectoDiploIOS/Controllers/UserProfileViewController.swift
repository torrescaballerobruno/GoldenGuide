//
//  UserProfileViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 21/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        nameLabel.clipsToBounds = true
//        nameLabel.layer.borderColor = UIColor.black.cgColor
        nameLabel.layer.borderWidth = 0.5
        nameLabel.layer.cornerRadius = 8
        phoneLabel.layer.borderWidth = 0.5
        phoneLabel.layer.cornerRadius = 8
        emailLabel.layer.borderWidth = 0.5
        emailLabel.layer.cornerRadius = 8
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
