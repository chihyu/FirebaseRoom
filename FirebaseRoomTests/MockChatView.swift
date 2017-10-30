//
//  MockChatView.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class MockChatView: ChatView {
    
    var mInputMessage:String = ""
    var mEnabled: Bool = false
    var mMessageAddedCalled: Bool = false
    
    func expectInputMessage(message:String) {
        mInputMessage = message
    }

    func getInputMessage() -> String {
        return mInputMessage
    }
    func cleanInputMessage() {
        mInputMessage = ""
    }
    
    func setButtonEnabled(enabled: Bool) {
        mEnabled = enabled
    }

    func messageAdded() {
        mMessageAddedCalled = true
    }
}
