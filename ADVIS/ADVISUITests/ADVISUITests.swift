//
//  ADVISUITests.swift
//  ADVISUITests
//
//  Created by Tatsumi Nishida on 2018/06/04.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import XCTest

class ADVISUITests: XCTestCase {
    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let app = XCUIApplication()
        let doneButton = app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"SCLAlertView\"].buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        doneButton.tap()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["MODULE"]/*[[".cells.staticTexts[\"MODULE\"]",".staticTexts[\"MODULE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["ジャンパワイヤ"]/*[[".cells.staticTexts[\"ジャンパワイヤ\"]",".staticTexts[\"ジャンパワイヤ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        doneButton.tap()

        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()

        let element2 = element.children(matching: .other).element(boundBy: 0)
        element2.tap()
        element2.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["LED"]/*[[".cells.staticTexts[\"LED\"]",".staticTexts[\"LED\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        doneButton.tap()

        let element3 = element.children(matching: .other).element(boundBy: 1)
        element3.tap()
        element3.tap()

        let voltRunButton = app.buttons["VOLT RUN"]
        voltRunButton.tap()
        voltRunButton.tap()

        let runButton = app.buttons["RUN"]
        runButton.tap()
        runButton.tap()
        app.buttons["CLEAN"].tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
