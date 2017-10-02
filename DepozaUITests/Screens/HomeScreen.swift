//
//  HomeScreen.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/28/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import Foundation
import XCTest

class HomeScreen : BaseScreen {
    
    let addExpenseButton = XCUIApplication().buttons["add_button"]
    
    func assertInitialAmountIs0(){
        let initialAmount = app.tables.staticTexts["total-Expenses_amount"]
        XCTAssert(initialAmount.exists, "Total amount exists")
        XCTAssert(initialAmount.label == "0", "Total amount is \(initialAmount.label)")
        
    }
    
    func tapAddExpenseButton(){
        tap(element: addExpenseButton)
    }
    
    func tapAddedExpense(){
        let addedExpense = tablesQuery()/*@START_MENU_TOKEN@*/.cells["expense_cell"]/*[[".cells[\"Stereo, 55\"]",".cells[\"expense_cell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Stereo"]
        tap(element: addedExpense)
    }
    
    //Asserts initial date exists, is labeled correcly, and is clickable
    func assertDateFunc(){
        
        let initialDate = app.navigationBars["Expenses"].buttons["October "]
        XCTAssert(initialDate.exists, "Date is not present")
        XCTAssert(initialDate.label == "October ", "Current date is \(initialDate.label)")
        XCTAssert(initialDate.isHittable, "Date is not hittable")
    }
    
    //Asserts search button exists, is labeled correcly, and is clickable
    func assertSearchButtonFunc(){
        
        let searchButtonTabBar = app.tabBars.buttons["Search"]
        XCTAssert(searchButtonTabBar.exists, "Search button does not exist")
        XCTAssert(searchButtonTabBar.label == "Search", "Search button label is incorrect")
        XCTAssert(searchButtonTabBar.isHittable, "Search button label is not hittable")
    }
    
    func assertAddExpenseButtonFunc(){
        
        XCTAssert(addExpenseButton.exists, "Add expense button does not exist")
        XCTAssert(addExpenseButton.isHittable, "Add expense button is not hittable")
    }
}
