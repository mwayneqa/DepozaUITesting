//
//  DeleteExpenseTest.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/29/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import XCTest

class DeleteExpenseTest : BaseTest {
    
    func testDeleteExpenseButton(){
        
        let addExpenseTest = AddExpenseTest()
        addExpenseTest.testAddExpense()
        
        //Taps expense added in previous test
        let home = HomeScreen()
        home.tapAddedExpense()
        snapshot("ExpenseDetails")
        
        let deleteExpense = DeleteExpenseScreen()
        deleteExpense.tapTrashButton()
        snapshot("DeletedExpense")
        
    }
        
    func testDeleteExpense(){
        
        let addExpenseTest = AddExpenseTest()
        addExpenseTest.testAddExpense()
        
        let deleteExpenseScreen = DeleteExpenseScreen()
        deleteExpenseScreen.deleteAddedExpense()
        
        deleteExpenseScreen.deletedTestExpenseIsDeleted()
        snapshot("NoRemainingExpenses")
        

    }
    
}
