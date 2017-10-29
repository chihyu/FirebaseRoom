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
    
    func expectInputMessage(message:String) {
        mInputMessage = message
    }

    func getInutMessage() -> String {
        return mInputMessage
    }
    func cleanInputMessage() {
        mInputMessage = ""
    }
}
