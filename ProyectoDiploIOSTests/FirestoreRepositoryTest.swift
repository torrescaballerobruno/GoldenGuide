//
//  FirestoreRepositoryTest.swift
//  ProyectoDiploIOSTests
//
//  Created by Ricardo Hernández González on 24/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import XCTest
@testable import ProyectoDiploIOS

class FirestoreRepositoryTest: XCTestCase {

    func testAddUser(){
        let user = User(userId: "id", email: "email", name: "name", lastname: "last", age: 10, address: Address(city: "city", state: "state", neighborhood: "nei", zipcode: "zip", street: "street"), phone: "1747173", userImage: nil, rating: nil)
        let result = FirestoreRepositoryForUsers.shared.addUser(user: user)
        XCTAssert(result)
    }

}
