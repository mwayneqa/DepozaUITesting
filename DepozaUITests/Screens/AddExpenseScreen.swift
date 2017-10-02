//
//  AddExpenseScreen.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/28/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import XCTest

class AddExpenseScreen : BaseScreen {
    
    
    func addExpense() {
        let initialAmountTextField = app.tables/*@START_MENU_TOKEN@*/.textFields["0"]/*[[".cells",".textFields[\"0\"]",".textFields[\"enter_amount\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[1]]@END_MENU_TOKEN@*/
        type(string: "55", field: initialAmountTextField)
        
        let electronicsExpense = tablesQuery()/*@START_MENU_TOKEN@*/.staticTexts["Electronics"]/*[[".cells.staticTexts[\"Electronics\"]",".staticTexts[\"Electronics\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tap(element: electronicsExpense)
        
        let expenseDescription = tablesQuery()/*@START_MENU_TOKEN@*/.textFields["enter_description"]/*[[".cells.textFields[\"enter_description\"]",".textFields[\"enter_description\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        type(string: "Stereo", field: expenseDescription)
        
        let doneButton = app.navigationBars["Add Expense"].buttons["Done"]
        tap(element: doneButton)
        
        let addedExpenseAmount =  tablesQuery()/*@START_MENU_TOKEN@*/.cells["expense_cell"]/*[[".cells[\"Stereo, 55\"]",".cells[\"expense_cell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["55"]
        let addedExpenseText = tablesQuery()/*@START_MENU_TOKEN@*/.cells["expense_cell"]/*[[".cells[\"Stereo, 55\"]",".cells[\"expense_cell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Stereo"]
        XCTAssert(addedExpenseAmount.exists, "New expense amount is \(addedExpenseAmount)")
        XCTAssert(addedExpenseText.exists, "New expense text reads \(addedExpenseText)")

    }
}
