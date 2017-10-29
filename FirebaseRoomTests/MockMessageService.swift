//
//  MockMessageService.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class MockMessageService: MessageService {
    
    var mActualSender:String?
    var mActualMessage:String?
    var mActualTimestamp:Int?
    
    func sendMessage(sender:String, message:String, timestamp:Int) {
        mActualSender = sender
        mActualMessage = message
        mActualTimestamp = timestamp
    }

    func getActualSender() -> String {
        return mActualSender ?? ""
    }
    
    func getActualMessage() -> String {
        return mActualMessage ?? ""
    }

    func getActualTimestamp() -> Int {
        return mActualTimestamp ?? 0
    }
}
