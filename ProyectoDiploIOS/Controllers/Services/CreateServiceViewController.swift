//
//  CreateServiceViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 23/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit
import MobileCoreServices

class CreateServiceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Attributes
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var descriptionTV: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    // MARK: - Overwritten Methodes
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Methodes
    
    @IBAction func searchImage(_ sender: UIButton) {
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        present(photoImage,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image.image = imageSelected
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func accept(_ sender: UIButton) {
        if let name = nameTF.text, name != "",
            let category = categoryTF.text, category != "",
            let priceText = priceTF.text, let price = Double(priceText),
            let description = descriptionTV.text, description != "",
            let imagen = image.image {
                let newService = Service(id: "", title: name, description: description, price: price, category: category, rating: 0, picture: nil, hirings: 0, comments: nil)
            
                serviceServices.createService(service: newService, image: imagen)
        }
            
    }
    
}
