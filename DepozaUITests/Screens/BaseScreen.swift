//
//  BaseScreen.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/29/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import XCTest

class BaseScreen {
    
    public let app = XCUIApplication()
    
    func tap(element: XCUIElement){
        element.tap()
    }
    
    func type(string : String, field : XCUIElement){
        tap(element: field)
        field.typeText(string)
    }
    
    func tablesQuery() -> XCUIElementQuery{
        return XCUIApplication().tables
    }
    
}
