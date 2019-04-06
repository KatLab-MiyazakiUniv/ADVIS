//
//  LineDrawTests.swift
//  ADVISTests
//
//  Created by Tatsumi Nishida on 4/5/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import XCTest

class LineDrawTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIntoBoardPoint() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let lineDraw = LineDraw()
        lineDraw.intoBoardPoint(startX: 10, startY: 20, endX: 30, endY: 40)
        XCTAssertEqual(lineDraw.startX, 10)
        XCTAssertEqual(lineDraw.startY, 20)
        XCTAssertEqual(lineDraw.endX, 30)
        XCTAssertEqual(lineDraw.endY, 40)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
