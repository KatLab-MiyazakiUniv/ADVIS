//
//  ResistorDrawTests.swift
//  ADVISTests
//
//  Created by Tatsumi Nishida on 4/5/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import XCTest

class ResitorDrawTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntoBoardPoint() {
        let resistorDraw = ResitorDraw()
        resistorDraw.intoBoardPoint(startX: 10, startY: 20, endX: 30, endY: 40)
        XCTAssertEqual(resistorDraw.startX, 10)
        XCTAssertEqual(resistorDraw.startY, 20)
        XCTAssertEqual(resistorDraw.endX, 30)
        XCTAssertEqual(resistorDraw.endY, 40)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
