//
//  ArduinoUnoPointControl12_9Tests.swift
//  ADVISTests
//
//  Created by Tatsumi Nishida on 2018/08/22.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

// @testable import ADVIS
import XCTest

class ArduinoUnoPointControl12_9Tests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testArduinoUnoPointControl12_9() {
        let arduinoUnoPointControll12_9 = ArduinoUnoPointControl12_9()
        let pointTranslate = arduinoUnoPointControll12_9.pointTranslate(pointX: 491, pointY: 55)
//         XCTAssertEqual(pointTranslate, 418)
        XCTAssert(pointTranslate == 418)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
