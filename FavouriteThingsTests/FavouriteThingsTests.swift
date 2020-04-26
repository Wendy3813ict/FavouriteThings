//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by mac on 24/4/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import XCTest
@testable import FavouriteThings

class FavouriteThingsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testCat() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            
            
            let type = "Pet"
            let name = "cat"
            let breed = "ragdoll"
            let character = "docile"
            let lifetime = "15-20"
            
            
            let test_values = Cat(type, name, breed, character, lifetime)
            XCTAssertEqual(test_values.type, type)
            XCTAssertEqual(test_values.name, name)
            XCTAssertEqual(test_values.breed, breed)
            XCTAssertEqual(test_values.character, character)
            XCTAssertEqual(test_values.lifetime, lifetime)
            
        }

        func testCatList(){
            let cat1 = Cat("Pet","cat","ragdoll","docile","15-20")
            let cat2 = Cat("Pet","cat","British shorthair","docile","15-20")
            let cats: [Cat] = [cat1,cat2]
            XCTAssertNotNil(cats[0].type)
            XCTAssertNotNil(cats[0].name)
            XCTAssertNotNil(cats[0].breed)
            XCTAssertNotNil(cats[0].character)
            XCTAssertNotNil(cats[0].lifetime)
            
            XCTAssertEqual(2, cats.count)
        }
        
        func testPerformanceExample() {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }

    }
