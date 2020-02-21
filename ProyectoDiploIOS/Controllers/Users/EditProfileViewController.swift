//
//  EditProfileViewController.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 21/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func changeImage(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }

}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagen = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image.image = imagen
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
