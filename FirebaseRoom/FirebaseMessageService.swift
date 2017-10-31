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
    var delegate: MessageAddedDelegate? = nil
    
    let MESSAGES_KEY = "messages"
    let MESSAGE_KEY = "message"
    let SENDER_KEY = "sender"
    let TIMESTAMP_KEY = "timestamp"
    
    var mMessages = [Message]()
    var ref: DatabaseReference!
    var mMessagesRef: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
        mMessagesRef = ref.child(MESSAGES_KEY)
    }

    func sendMessage(sender:String, message:String, timestamp:Int) {
        let itemRef = mMessagesRef.childByAutoId()
        let messageItem = [
            MESSAGE_KEY: message,
            SENDER_KEY: sender,
            TIMESTAMP_KEY:  timestamp
            ] as [String : Any]
        itemRef.setValue(messageItem)
    }
    
    func setMessageAddedDelegate(delegate:MessageAddedDelegate) {
        self.delegate = delegate
        mMessagesRef.observe(.childAdded) { (snapshot:DataSnapshot) in
            let dictionary = snapshot.value as! Dictionary<String, Any>
            self.delegate!.messageAdded(message: Message(sender: dictionary[self.SENDER_KEY] as! String, message: dictionary[self.MESSAGE_KEY] as! String, timestamp: dictionary[self.TIMESTAMP_KEY] as! Int))
        }
    }
}
