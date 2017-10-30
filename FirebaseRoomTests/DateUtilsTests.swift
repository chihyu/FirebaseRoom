//
//  DateUtilsTests.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/31.
//  Copyright © 2017年 Katy. All rights reserved.
//

import XCTest

class DateUtilsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToDateTimeString() {
        XCTAssertEqual("2017-10-30 21:40:30", DateUtils.toDateTimeString(timestampInSec: 1509370830))
    }
    
}
