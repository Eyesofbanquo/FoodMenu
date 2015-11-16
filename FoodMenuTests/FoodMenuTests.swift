//
//  FoodMenuTests.swift
//  FoodMenuTests
//
//  Created by Markim Shaw on 11/11/15.
//  Copyright © 2015 Markim Shaw. All rights reserved.
//

import XCTest
@testable import FoodMenu

class FoodMenuTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    /* Tests to make sure that the initializer still returns even when the rating is negative 
        and because the name is empty*/
    func testMealInitialization(){
        
        //success cases
        let potentialMeal = Meal(name: "Newest Meal", image: nil, rating: 5)
        //let potenil = Meal(name: "Ok",
        XCTAssertNotNil(potentialMeal)
        
        //failures
        let noName = Meal(name: "", image: nil, rating: 5)
        XCTAssertNil(noName)
        
        let badRating = Meal(name: "Really bad rating", image: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
