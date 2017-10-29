//
//  FirebaseMessageService.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseMessageService: MessageService {
    
    let MESSAGE_KEY = "message"
    let SENDER_KEY = "sender"
    let TIMESTAMP_KEY = "timestamp"
    
    var ref: DatabaseReference!
    var messageRef: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
        messageRef = ref.child("messages")
    }

    func sendMessage(sender:String, message:String, timestamp:Int) {
        let itemRef = messageRef.childByAutoId()
        let messageItem = [
            MESSAGE_KEY: message,
            SENDER_KEY: sender,
            TIMESTAMP_KEY:  timestamp
            ] as [String : Any]
        itemRef.setValue(messageItem)
    }
}