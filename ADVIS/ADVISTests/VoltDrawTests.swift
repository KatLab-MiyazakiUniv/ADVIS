//
//  VoltDrawTests.swift
//  ADVISTests
//
//  Created by Tatsumi Nishida on 4/5/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import XCTest

class VoltDrawTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntoBoardPoint() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let voltDraw = VoltDraw()
        voltDraw.intoBoardPoint(startX: 10, startY: 20, endX: 30, endY: 40)
        XCTAssertEqual(voltDraw.startX, 10)
        XCTAssertEqual(voltDraw.startY, 20)
        XCTAssertEqual(voltDraw.endX, 30)
        XCTAssertEqual(voltDraw.endY, 40)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
