//
//  PodsTestProjectUITestsLaunchTests.swift
//  PodsTestProjectUITests
//
//  Created by Анжелика on 10.07.24.
//

import XCTest

final class PodsTestProjectUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "SQUARE"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
