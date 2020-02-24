//
//  ImageConvertTest.swift
//  ProyectoDiploIOSTests
//
//  Created by Ricardo Hernández González on 24/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import XCTest
@testable import ProyectoDiploIOS

class ImageConvertTest: XCTestCase {

    func testImageToBase64test(){
        let image = UIImage(named: "logout")
        let base64 = imageConvert.shared.convertImageToBase64String(img: image!)
        XCTAssertNotNil(base64)
    }
    
    func testBase64ToImage(){
        let imagen =  UIImage(named: "logout")
        let base64 = imageConvert.shared.convertImageToBase64String(img: imagen!)
        let image = imageConvert.shared.convertBase64StringToImage(imageBase64String: base64)
        XCTAssertNotNil(image)
        
    }

}
