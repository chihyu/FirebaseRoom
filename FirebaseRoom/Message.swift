//
//  Message.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class Message {
    
    let mSender: String
    let mMessage: String
    let mTimestamp: Int
    
    init(sender: String, message: String, timestamp: Int) {
        mSender = sender;
        mMessage = message
        mTimestamp = timestamp
    }
}
