//
//  DeleteExpenseScreen.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/29/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import XCTest

class DeleteExpenseScreen : BaseScreen {
    
    let deleteAppAlert = XCUIApplication().alerts["Delete transaction?"].buttons["Delete"]
    
    //Deletes added test expense
    func deleteAddedExpense(){
        
        let existingExpenseText = tablesQuery()/*@START_MENU_TOKEN@*/.cells["expense_cell"]/*[[".cells[\"Stereo, 55\"]",".cells[\"expense_cell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Stereo"]
        tap(element: existingExpenseText)
        
        let trashButton = app.navigationBars["Expense"].buttons["Trash"]
        tap(element: trashButton)
        
        tap(element: deleteAppAlert)
    }
    
    func tapTrashButton(){
        
        let trashButton = app.navigationBars["Expense"].buttons["Trash"]
        XCTAssert(trashButton.exists, "Trash button does not exist")
        XCTAssert(trashButton.isHittable, "Trash button is not hittable")
        tap(element: trashButton)
        tap(element: deleteAppAlert)
    }
    
    //Checks that deleted test expense is no longer visible
    func deletedTestExpenseIsDeleted(){
        
        let deletedExpenseText = tablesQuery()/*@START_MENU_TOKEN@*/.cells["expense_cell"]/*[[".cells[\"Stereo, 55\"]",".cells[\"expense_cell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Stereo"]
        XCTAssertFalse(deletedExpenseText.exists, "Remaining expense is \(deletedExpenseText)")
    }
}
