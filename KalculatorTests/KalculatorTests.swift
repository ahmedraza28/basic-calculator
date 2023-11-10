// KalculatorTests.swift
// KalculatorTests
//
// Created by Adil Saleem on 31/10/2023.
// Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest
@testable import Kalculator

final class KalculatorTests: XCTestCase {

    private var calculator: Calculator!
    private var viewController: ViewController!
    
    // MARK: - Setup and Teardown
    
    override func setUpWithError() throws {
        calculator = Calculator()
        super.setUp()
        
        // Creating a ViewController for testing
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        _ = viewController.view
    }

    override func tearDownWithError() throws {
        calculator = nil
        super.tearDown()
    }

    // MARK: - Positive and Negative Test Cases for Inputting Digits

    func test_positive_input_append_Digit() {
        // Checking if basic operations give the expected result
        var operation: CalculatorOperation
        operation = .add
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        operation = .subtract
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        operation = .multiply
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        operation = .divide
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")

        // Checking if digits are correctly appended
        var input = "1"
        XCTAssertEqual(try calculator.inputDigit(input), "1")
        input = "2"
        XCTAssertEqual(try calculator.inputDigit(input), "12")
    }

    func test_negative_inputDigit() {
        // Making sure invalid inputs throw errors
        var input = "ABC"
        XCTAssertThrowsError(try calculator.inputDigit(input))
        input = "%"
        XCTAssertThrowsError(try calculator.inputDigit(input))
    }

    func test_negative_appendDigit() {
        // Making sure invalid inputs throw errors
        var input = "@"
        XCTAssertThrowsError(try calculator.appendDigit(input))
        input = "#"
        XCTAssertThrowsError(try calculator.appendDigit(input))
    }

    // MARK: - Positive and Negative Test Cases for Basic Operations

    func test_positive_addOperation() {
        // Making sure addition works as expected
        // ...
    }

    func test_negative_addOperation() {
        // Making sure addition fails for incorrect inputs
        // ...
    }

    func test_positive_subtractOperation() {
        // Making sure subtraction works as expected
        var num1 = "4"
        var num2 = "3"
        var operation: CalculatorOperation
        operation = .subtract
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "1")
    }

    func test_negative_subtractOperation() {
        // Making sure subtraction fails for incorrect inputs
        var num1 = "7"
        var num2 = "3"
        var operation: CalculatorOperation
        operation = .subtract
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertNotEqual(try calculator.inputDigit(operation.rawValue), "5")
    }

    func test_positive_multiplyOperation() {
        // Making sure multiplication works as expected
        var num1 = "5"
        var num2 = "6"
        var operation: CalculatorOperation
        operation = .multiply
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "30")
    }

    func test_negative_multiplyOperation() {
        // Making sure multiplication fails for incorrect inputs
        var num1 = "3"
        var num2 = "5"
        var operation: CalculatorOperation
        operation = .multiply
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertNotEqual(try calculator.inputDigit(operation.rawValue), "35")
    }

    func test_positive_divideOperation() {
        // Making sure division works as expected
        var num1 = "8"
        var num2 = "2"
        var operation: CalculatorOperation
        operation = .divide
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "4")
    }

    func test_negative_divideOperation() {
        // Making sure division fails for incorrect inputs
        var num1 = "8"
        var num2 = "0"
        var operation: CalculatorOperation
        operation = .divide
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertThrowsError(try calculator.inputDigit(operation.rawValue))
    }

    // MARK: - Test Cases for Clearing

    func test_clear() {
        // Testing if the calculator can be cleared
        // ...
    }

    // MARK: - Test Cases for ViewController Class

    func test_VC_inputDigit() {
        // Testing if ViewController's inputDigit works as expected
        // ...
    }

    func test_VC_clear() {
        // Testing if ViewController's clear function resets the screen
        // ...
    }
}
