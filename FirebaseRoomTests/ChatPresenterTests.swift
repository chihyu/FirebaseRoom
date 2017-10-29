//
//  ChatPresenterTests.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import XCTest

class ChatPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSend() {
        let chatView:MockChatView = MockChatView()
        let messageService:MockMessageService = MockMessageService()
        let name = "Katy"
        let message = "How are you?"
        let testee:ChatPresenter = ChatPresenter(view:chatView, messageService: messageService, userName: name)
        chatView.expectInputMessage(message: message)
        testee.send()
        XCTAssertEqual(name, messageService.getActualSender())
        XCTAssertEqual(message, messageService.getActualMessage())
        XCTAssertTrue(messageService.getActualTimestamp() != 0)
        XCTAssertEqual("", chatView.getInutMessage())
    }
    
}
