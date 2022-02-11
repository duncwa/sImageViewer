//
//  sFastIconUISNAPTestsLaunchTests.swift
//  sFastIconUISNAPTests
//
//  Created by Duncan Wallace on 12/16/21.
//  Copyright © 2021 Duncan Wallace. All rights reserved.
//

import XCTest

class sFastIconUISNAPTestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
