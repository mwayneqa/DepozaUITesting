//
//  AddExpenseTest.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 9/28/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import XCTest

class AddExpenseTest: BaseTest {
    
    func testAddExpense(){
        
        let home = HomeScreen()
        home.tapAddExpenseButton()
        
        let expense = AddExpenseScreen()
        expense.addExpense()
        snapshot("AddedExpense")
        
    }
    
}
