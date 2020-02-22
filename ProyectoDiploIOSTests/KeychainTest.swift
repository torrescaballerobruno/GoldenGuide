//
//  KeychainTest.swift
//  ProyectoDiploIOSTests
//
//  Created by Ricardo Hernández González on 19/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import XCTest
//import Firebase
@testable import ProyectoDiploIOS

class KeychainTest: XCTestCase {

    func testGetKeychain(){
        let key = KeychainManager.shared.retrieveData(key: "test")
        XCTAssertNil(key)
    }
    
    func testSaveKey(){
        KeychainManager.shared.saveData(data: "foo", key: "bar")
        let key = KeychainManager.shared.retrieveData(key: "bar")
        XCTAssertNotNil(key)
        XCTAssertEqual(key, "foo")
    }
    
    func testDeleteKey(){
        KeychainManager.shared.saveData(data: "test", key: "foo")
        KeychainManager.shared.deleteData(key: "foo")
        let key = KeychainManager.shared.retrieveData(key: "foo")
        XCTAssertNil(key)
        
    }

}
