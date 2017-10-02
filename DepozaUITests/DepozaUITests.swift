//
//  DepozaUITests.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/22/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class DepozaUITests: XCTestCase {
    let app = XCUIApplication()
    let clothes_expense = "t-shirt"
    let price = "100"


    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app.launchArguments = ["isUiTesting"];
        app.launch()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testAddingNewExpense() {

        app.buttons["add_button"].tap()

        let tablesQuery = app.tables
        tablesQuery.textFields["enter_amount"].tap()
        tablesQuery.textFields["enter_amount"].typeText(price)

        tablesQuery.staticTexts["Clothes"].tap()

        let descriptionField = tablesQuery.textFields["enter description"]

        waitAndTap(element: descriptionField, time: 2.0)
        descriptionField.typeText(clothes_expense)


        app.navigationBars["Add Expense"].buttons["Done"].tap()

        let actual_result = tablesQuery.staticTexts["total-Expenses_amount"].label
        XCTAssert(actual == "100")
    }

    func testDeleteExpense(){
        //create expense before deleting one
        testAddingNewExpense()

        sleep(2)
        let tablesQuery = app.tables;
        let expense_cell = tablesQuery.cells["\(clothes_expense), \(price)"]

        waitAndTap(element: expense_cell, time: 3.0)

        let trashButton = app.navigationBars["Expense"].buttons["Trash"]
        trashButton.tap()

        let deleteButton = app.alerts["Delete transaction?"].buttons["Delete"]
        deleteButton.tap()

        let total_amount = tablesQuery.staticTexts["total_expenses_amount"]
        let actual = total_ammount.label

        waitForElementToAppear(format: "isEnabled == true", element: total_ammount, time: 3.0)

        XCTAssert(actual == "0")

        waitForElementToAppear(format: "self.count = 1", element: tablesQuery, time: 3.0)


        XCTAssertEqual(tablesQuery.cells.count, 0, "found instead: \(tablesQuery.cells.debugDescription)")

    }

    func waitForElementToAppear(format: String, element: AnyObject, time: Double) {
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith:element, handler: nil)
        waitForExpectations(timeout: time, handler: nil)
    }
}

