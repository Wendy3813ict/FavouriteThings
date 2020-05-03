//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by mac on 24/4/20.
//  Copyright © 2020 Wendy Yu. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FavouriteThings

class FavouriteThingsTests: XCTestCase {

    var catList = CatList()
    // testCatValues is to test the data
    let testCatValues = Cat (
        "",
        "PET",
        "cat",
        "ragdoll",
        "docile",
        "15-20",
        "ragdoll lovers",
        "breed",
        "lifetime"
    )
       
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testCat() {
    let url = ""
    let type = "Pet"
    let name = "cat"
    let breed = "ragdoll"
    let character = "docile"
    let lifetime = "15-20"
    let notes = "Rogdoll lovers"
    let title_field1 =  "Breed"
    let title_field2 = "Lifetime"
            
    let test_values = Cat(url, type, name, breed, character, lifetime, notes, title_field1, title_field2)
        XCTAssertEqual(test_values.type, type)
        XCTAssertEqual(test_values.name, name)
        XCTAssertEqual(test_values.breed, breed)
        XCTAssertEqual(test_values.character, character)
        XCTAssertEqual(test_values.lifetime, lifetime)
        XCTAssertEqual(test_values.notes, notes)
        XCTAssertEqual(test_values.title_field1, title_field1)
        XCTAssertEqual(test_values.title_field2, title_field2)
        }
    
    func testCatType() {
        XCTAssertNotNil(testCatValues.type)
        XCTAssertEqual(testCatValues.type, "PET")
    }
    
    func testCatName() {
        XCTAssertNotNil(testCatValues.name)
        XCTAssertEqual(testCatValues.name, "Cat")
    }
    
    func testCatBreed() {
        XCTAssertNotNil(testCatValues.breed)
        XCTAssertEqual(testCatValues.breed, "ragdoll")
    }
    func testCatCharacter() {
        XCTAssertNotNil(testCatValues.character)
        XCTAssertEqual(testCatValues.character, "docile")
    }
    func testCatLifetime() {
        XCTAssertNotNil(testCatValues.lifetime)
        XCTAssertEqual(testCatValues.lifetime, "15-20")
    }
    
    func testCatNotes (){
        XCTAssertEqual(testCatValues.notes, "Rogdoll lovers")
    }
    
    func testCatTitle_Field1 (){
        XCTAssertEqual(testCatValues.title_field1, "Breed")
    }
    
    func testCatTitle_Field2 (){
        XCTAssertEqual(testCatValues.title_field2, "Lifetime")
    }
    
    func testDownloadedImage() {
        // Checks download url image is correct or not
        guard let imageURL = URL(string:"https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.icons8.com%2Fplasticine%2F2x%2Fdog.png&imgrefurl=https%3A%2F%2Ficons8.com%2Ficons%2Fset%2Fdog&tbnid=EADq3aFb7W636M&vet=12ahUKEwj6zcCJ2ZfpAhUpMbcAHTaUCG8QMygDegUIARDdAQ..i&docid=lEP3b81wl2A4PM&w=200&h=200&q=dog%20icon&ved=2ahUKEwj6zcCJ2ZfpAhUpMbcAHTaUCG8QMygDegUIARDdAQ")
            else {
                return XCTFail("Wrong URL. Insert the correct URL")
        }
        
        // Check the data
        guard let imageData = try? Data(contentsOf: imageURL)
            else {
               return XCTFail("Unsuccessful image download")
        }
        
        guard let uiImage = UIImage(data: imageData)
            else {
             return XCTFail("Data not include image")
           }
        
        // Check the set up image from imageData is not nill
        let downloadedImage = Image(uiImage: uiImage)
        XCTAssertNotNil(downloadedImage)
    }
    
    
    /// Test the  encoding and decoding of JSON data
    func testJSON() {
    
        do {
            let t = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedModel = try decoder.decode(CatList.self, from: t)
            catList = decodedModel
            }
            catch {
                print("Cannot to decode the data \(fileURL.path) \(error)")
            }
    
        do {
            let json = JSONEncoder()
            let data = try json.encode(catList)
            try data.write(to: fileURL)
            }
            catch {
               print("Cannot to encode the data \(fileURL.path) \(error)")
            }
    }
            func testPerformanceExample() {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }

    }
