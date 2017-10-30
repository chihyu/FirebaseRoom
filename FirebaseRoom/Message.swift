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

    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(Int(mTimestampInSec))) as Date)
    }
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.mSender.elementsEqual(rhs.mSender) &&
            lhs.mTimestampInSec == rhs.mTimestampInSec &&
            lhs.mMessage.elementsEqual(rhs.mMessage)
    }
}
