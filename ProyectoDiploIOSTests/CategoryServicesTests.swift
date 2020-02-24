//
//  CategoryServicesTests.swift
//  ProyectoDiploIOSTests
//
//  Created by Bruno Torres on 23/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import XCTest
@testable import ProyectoDiploIOS

class CategoryServicesTests: XCTestCase {
    
    var cs: CategoryService!
    
    override func setUp() {
        cs = CategoryService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateCategories() {
        let exp = expectation(description: "Successfull index posts")
        let categories: [ProyectoDiploIOS.Category] = [Category(id: nil,type: "Veterinario"),
                                Category(id: nil,type: "Medico"),
                                Category(id: nil,type: "Plomero")]
        
        for cat in categories {
            
            cs.createCategory(category: cat, success: { (error) in
                    exp.fulfill()
                })
            /*XCTAssertTrue( cs.createCategory(category: cat){(error?) in
                
                
            })*/
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetCategories() {
        let cats = cs.getCategories()
        print(cats)
        XCTAssertNotNil(cats)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
