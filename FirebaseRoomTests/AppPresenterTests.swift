//
//  AppPresenterTests.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/31.
//  Copyright © 2017年 Katy. All rights reserved.
//

import XCTest

class AppPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOpenAppWithUserName() {
        let launcher: MockLauncher = MockLauncher()
        let testee: AppPresenter = AppPresenter(launcher: launcher, userName: "Katy")
        testee.open()
        XCTAssertTrue(launcher.isGoToChatViewCalled())
    }
    
    func testOpenAppWithEmptyUserName() {
        let launcher: MockLauncher = MockLauncher()
        let testee: AppPresenter = AppPresenter(launcher: launcher, userName: "")
        testee.open()
        XCTAssertTrue(launcher.isGoToInputNameViewCalled())
    }
}
