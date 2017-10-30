//
//  MessageTests.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/30.
//  Copyright © 2017年 Katy. All rights reserved.
//

import XCTest

class MessageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDate() {
        let testee: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1509370830)
        XCTAssertEqual("2017-10-30 21:40:30", testee.getDate())
    }

    func testEuqal() {
        let testee1: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1509370830)
        let testee2: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1509370830)
        XCTAssertEqual(testee1, testee2)
    }
    
    func testNotEqual_withDifferentSender() {
        let testee1: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1509370830)
        let testee2: Message = Message(sender: "Mary", message: "Hello!", timestamp: 1509370830)
        XCTAssertNotEqual(testee1, testee2)
    }

    func testNotEqual_withDifferentMessage() {
        let testee1: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1509370830)
        let testee2: Message = Message(sender: "Katy", message: "Bye!", timestamp: 1509370830)
        XCTAssertNotEqual(testee1, testee2)
    }
    
    func testNotEqual_withDifferentTimestamp() {
        let testee1: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1509370830)
        let testee2: Message = Message(sender: "Katy", message: "Hello!", timestamp: 1111111111)
        XCTAssertNotEqual(testee1, testee2)
    }
}
