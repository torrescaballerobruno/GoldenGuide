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
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    
    var imagePicker = UIImagePickerController()
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        name.text = user.name
        phone.text = user.phone
        email.text = user.email
        if let imageProfile = user.userImage{
            image.image = imageConvert.shared.convertBase64StringToImage(imageBase64String: imageProfile)
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func changeImage(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    @IBAction func saveNewProfile(_ sender: UIButton) {
        guard let name = name.text, name != "",
            let phone = phone.text, phone != ""
        else{
            present(AlertsCreator(title: "Campos obligatorios", message: "No pueden dejarse vacios los campos").createAlert(), animated: true)
            return
        }
        self.user.name = name
        self.user.phone = phone
        if FirestoreRepositoryForUsers.shared.addUser(user: self.user){
//            present(AlertsCreator(title: "Actualizacion exitosa", message: "los datos fueron actualizados con exito").createAlert(), animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagen = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image.image = imagen
            let imageToBase64 = imageConvert.shared.convertImageToBase64String(img: imagen)
            self.user.userImage = imageToBase64
//            print("base 64: ", imageToBase64)
//            let base64ToImage = imageConvert.shared.convertBase64StringToImage(imageBase64String: imageToBase64)
//            image.image = base64ToImage
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
