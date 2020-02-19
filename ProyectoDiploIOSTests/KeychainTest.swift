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
        let key = KeychainManager.shared.retrieveKey(key: "test")
        XCTAssertNil(key)
    }
    
    func saveKeyTest(){
        KeychainManager.shared.saveKey(data: "foo", key: "bar")
        let key = KeychainManager.shared.retrieveKey(key: "bar")
        XCTAssertNotNil(key)
        XCTAssertEqual(key, "foo")
    }
    
    func deleteKeyTest(){
        KeychainManager.shared.saveKey(data: "test", key: "foo")
        KeychainManager.shared.deleteKey(key: "foo")
        let key = KeychainManager.shared.retrieveKey(key: "foo")
        XCTAssertNil(key)
        
    }

}
