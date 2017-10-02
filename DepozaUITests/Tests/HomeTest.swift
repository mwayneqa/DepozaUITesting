//
//  HomeTest.swift
//  DepozaUITests
//
//  Created by Matthew Wayne on 10/2/17.
//  Copyright © 2017 Ivan Magda. All rights reserved.
//

import XCTest

class HomeTest: BaseTest {
    
    let home = HomeScreen()
    
    func testInitialAmount(){
        home.assertInitialAmountIs0()
        snapshot("InitialAmountHomeScreen0")
    }
    
    func testAddExpenseButton(){
        
        home.assertAddExpenseButtonFunc()
        snapshot("InitialHomeScreen")
        
    }
    
    func testInitialDate(){
        
        home.assertDateFunc()
        snapshot("InitialDateHome")

    }
    
    func testSearchButton(){
        
        home.assertSearchButtonFunc()
        snapshot("SearchButtonHome")
    }
    
}
