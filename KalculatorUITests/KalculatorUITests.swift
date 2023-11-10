//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest

final class CalculatorUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // Test Cases for checking the existence of all the Buttons
    func testButtonsExistence() {
        XCTAssertTrue(app.buttons["C"].exists)
        
        XCTAssertTrue(app.buttons["+"].exists)
        XCTAssertTrue(app.buttons["-"].exists)
        XCTAssertTrue(app.buttons["*"].exists)
        XCTAssertTrue(app.buttons["/"].exists)
        XCTAssertTrue(app.buttons["="].exists)

        XCTAssertTrue(app.buttons["0"].exists)
        XCTAssertTrue(app.buttons["1"].exists)
        XCTAssertTrue(app.buttons["2"].exists)
        XCTAssertTrue(app.buttons["3"].exists)
        XCTAssertTrue(app.buttons["4"].exists)
        XCTAssertTrue(app.buttons["5"].exists)
        XCTAssertTrue(app.buttons["6"].exists)
        XCTAssertTrue(app.buttons["7"].exists)
        XCTAssertTrue(app.buttons["8"].exists)
        XCTAssertTrue(app.buttons["9"].exists)
    }
    
    // Test Cases for checking the Result Screen
    func testResultScreen() {
        var digitButton = "5"
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, digitButton)
        
        digitButton = "8"
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "58")
        
        digitButton = "+"
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "58")
        
        digitButton = "3"
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "3")
        
        digitButton = "2"
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "32")
        
        digitButton = "="
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "90")
        
        digitButton = "C"
        app.buttons[digitButton].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
    }
    
    // Test Cases for checking the Calculated Output
    func testCalculatedOutput() {
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["/"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "5")
        
        app.buttons["*"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "390")
        
        app.buttons["+"].tap()
        app.buttons["9"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "482")
        
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "422")
    }
    
    // Test Case for checking Error Detection and Handling
    func testErrorDetectionAndHandling() {
        app.buttons["1"].tap()
        app.buttons["6"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "Err")
        
        app.buttons["C"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
    }
}
