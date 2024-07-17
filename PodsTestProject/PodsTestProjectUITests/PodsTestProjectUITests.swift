//
//  PodsTestProjectUITests.swift
//  PodsTestProjectUITests
//
//  Created by Анжелика on 10.07.24.
//

import XCTest
 
final class PodsTestProjectUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 5) {
          let exists = NSPredicate(format: "exists == 1")
          expectation(for: exists, evaluatedWith: element, handler: nil)
          waitForExpectations(timeout: timeout, handler: nil)
      }
    
    func testTableViewDisplay() throws {
        let tableView = app.tables.firstMatch
        XCTAssertTrue(tableView.exists, "The table view exists")
    }
    
    func testTableFirstCellExist() throws {
        let tableView = app.tables.firstMatch
        let firstCell = tableView.cells.element(boundBy: 0)
        waitForElementToAppear(firstCell)
        XCTAssertTrue(firstCell.exists, "The first cell exists")
    }
}
