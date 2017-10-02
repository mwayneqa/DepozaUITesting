//
//  BaseTest.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/28/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

//import Foundation
import XCTest

class BaseTest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = true
        app.launchArguments = ["isUiTesting"];
        setupSnapshot(app)
        app.launch()
        
    }
    
    override func tearDown(){
        super.tearDown()
    }
    
    func tablesQuery() -> XCUIElementQuery{
        return app.tables
    }
    
    func waitForElementToAppear(format: String, element: AnyObject, time: Double){
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith:element, handler: nil)
    }
    
    
}
