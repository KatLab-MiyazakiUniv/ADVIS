//
//  LedDrawTests.swift
//  ADVISTests
//
//  Created by Tatsumi Nishida on 4/5/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import XCTest

class LedDrawTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntoBoardPoint() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ledDraw = LedDraw()
        ledDraw.intoBoardPoint(startX: 100, startY: 200, endX: 300, endY: 400)
        XCTAssertEqual(ledDraw.startX, 100)
        XCTAssertEqual(ledDraw.startY, 200)
        XCTAssertEqual(ledDraw.endX, 300)
        XCTAssertEqual(ledDraw.endY, 400)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
