//
//  XCUIElement.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 4/7/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement /* TapAtPosition */ {
    /// 座標をタップするためのメソッド
    ///
    /// - Parameter position: タップする座標
    func tapAtPosition(position: CGPoint) {
        let cooridnate = coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).withOffset(CGVector(dx: position.x, dy: position.y))
        cooridnate.tap()
    }

    func tapCoordinate(at xCoordinate: Double, and yCoordinate: Double) {
        let normalized = self.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
}
