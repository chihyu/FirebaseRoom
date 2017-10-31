//
//  Message.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class Message: Equatable {
    
    let mSender: String
    let mMessage: String
    let mTimestampInSec: Int
    
    init(sender: String, message: String, timestamp: Int) {
        mSender = sender;
        mMessage = message
        mTimestampInSec = timestamp
    }
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.mSender.elementsEqual(rhs.mSender) &&
            lhs.mTimestampInSec == rhs.mTimestampInSec &&
            lhs.mMessage.elementsEqual(rhs.mMessage)
    }
}
