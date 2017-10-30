//
//  ChatPresenterTests.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import XCTest

class ChatPresenterTests: XCTestCase {
    
    let SENDER = "Katy"
    var mChatView: MockChatView!
    var mMessageService: MockMessageService!
    var mTestee:ChatPresenter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mChatView = MockChatView()
        mMessageService = MockMessageService();
        mTestee = ChatPresenter(view:mChatView, messageService: mMessageService, userName: SENDER)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSend() {
        
        let message = "How are you?"
        mChatView.expectInputMessage(message: message)
        mTestee.send()
        XCTAssertEqual(SENDER, mMessageService.getActualSender())
        XCTAssertEqual(message, mMessageService.getActualMessage())
        XCTAssertTrue(mMessageService.getActualTimestamp() != 0)
        XCTAssertEqual("", mChatView.getInutMessage())
    }
    
    func testCheckButtonEnabled_withEmptyMessage() {
        mChatView.expectInputMessage(message: "")
        mTestee.checkButtonEnabled()
        XCTAssertFalse(mChatView.mEnabled)
    }
    
    func testCheckButtonEnabled_withMessage() {

        mChatView.expectInputMessage(message: "Hello")
        mTestee.checkButtonEnabled()
        XCTAssertTrue(mChatView.mEnabled)
    }
    
    func testMessageAdded() {
        let message: Message! = Message(sender: SENDER, message: "Hello", timestamp: 123456)
        mTestee.messageAdded(message: message)
        XCTAssertEqual(1, mTestee.getMessageCount())
        XCTAssertTrue(mChatView.mMessageAddedCalled)
    }
    
    func testGetMessage() {
        let message: Message = Message(sender: SENDER, message: "Hello", timestamp: 123456)
        mTestee.messageAdded(message: message)
        XCTAssertEqual(message, mTestee.getMessage(index: 0))
    }
}
