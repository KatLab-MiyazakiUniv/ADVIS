//
//  MemoryLeakTest.swift
//  ExpandableCellTests
//
//  Created by Lena Brusilovski on 17/10/2018.
//  Copyright © 2018 SeungyounYi. All rights reserved.
//

@testable import ExpandableCellDemo
import XCTest
class MemoryLeakTest: XCTestCase {
    weak var viewController: ViewController?
    weak var navigationController: UINavigationController?
    override func setUp() {
        if let nav = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController) {
            navigationController = nav
            viewController = nav.visibleViewController as? ViewController
        }

        XCTAssertNotNil(navigationController)
        XCTAssertNotNil(viewController)
    }

    override func tearDown() {
        viewController = nil
        navigationController = nil
    }

    func testNotLeakingExpandableDelegate() {
        XCTAssertNotNil(viewController?.tableView.expandableDelegate)
        viewController?.performSegue(withIdentifier: "replace", sender: nil)
        let expectation = self.expectation(description: "wait for view controller to load")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let visibleVC = self.navigationController?.visibleViewController
            XCTAssertTrue(visibleVC != self.viewController)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
        XCTAssertNil(viewController?.tableView.expandableDelegate)
    }
}
