//
//  imageConvert.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 23/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

struct imageConvert{
    static let shared = imageConvert()
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage? {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image
    }
}
