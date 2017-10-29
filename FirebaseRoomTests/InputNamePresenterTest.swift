//
//  InputNamePresenterTest.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import XCTest

class InputNamePresenterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCheckGoButtonEnabled_withName() {
        let inputNameView:MockInputNameView = MockInputNameView()
        inputNameView.mInputName = "Mary"
        let testee: InputNamePresenter = InputNamePresenter(view: inputNameView)
        testee.checkGoButtonEnabled()
        XCTAssertEqual(true, inputNameView.mEnabled)
    }

    func testCheckGoButtonEnabled_withEmptyName() {
        let inputNameView:MockInputNameView = MockInputNameView()
        inputNameView.mInputName = ""
        let testee: InputNamePresenter = InputNamePresenter(view: inputNameView)
        testee.checkGoButtonEnabled()
        XCTAssertEqual(false, inputNameView.mEnabled)
    }
}
