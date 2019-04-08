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

    func testVoltRun() {
        let app = XCUIApplication()

        let doneButton = app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"SCLAlertView\"].buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        doneButton.tap()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["MODULE"]/*[[".cells.staticTexts[\"MODULE\"]",".staticTexts[\"MODULE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["ジャンパワイヤ"]/*[[".cells.staticTexts[\"ジャンパワイヤ\"]",".staticTexts[\"ジャンパワイヤ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        doneButton.tap()

        let rootviewElement = app.otherElements["RootView"]
        let volt33Point = CGPoint(x: 593, y: 973) // 3.3V
        let gndPoint = CGPoint(x: 491, y: 54) // a15
        let a15Point = CGPoint(x: 560, y: 654) // GND
        let j15Point = CGPoint(x: 560, y: 327) // j15
        rootviewElement.tapAtPosition(position: volt33Point)
        rootviewElement.tapAtPosition(position: a15Point)
        rootviewElement.tapAtPosition(position: gndPoint)
        rootviewElement.tapAtPosition(position: j15Point)

        app.buttons["VOLT RUN"].tap()
        var voltLabel = app.staticTexts["3"]
        XCTAssertEqual(voltLabel.label, "3")
        sleep(3)
        app.buttons["VOLT RUN"].tap()

        tablesQuery.staticTexts["LED"].tap()
        doneButton.tap()
        let e15Point = CGPoint(x: 560, y: 530) // e15
        let f15Point = CGPoint(x: 560, y: 452) // f15
        rootviewElement.tapAtPosition(position: e15Point)
        rootviewElement.tapAtPosition(position: f15Point)

        app.buttons["VOLT RUN"].tap()
        voltLabel = app.staticTexts["2"]
        XCTAssertEqual(voltLabel.label, "2")
        sleep(5)
    }
}
