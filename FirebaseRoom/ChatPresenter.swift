//
//  ChatPresenter.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class ChatPresenter: MessageAddedDelegate {

    let mView: ChatView
    let mMessageService: MessageService
    let mUserName: String
    var mMessages = [Message]()
    
    init(view: ChatView, messageService: MessageService, userName: String) {
        mView = view
        mMessageService = messageService
        mUserName = userName
    }

    func send() {
        mMessageService.sendMessage(sender: mUserName, message: mView.getInputMessage(), timestamp: Int(NSDate().timeIntervalSince1970))
        mView.cleanInputMessage()
        checkButtonEnabled()
    }
    
    func checkButtonEnabled() {
        mView.setButtonEnabled(enabled: !mView.getInputMessage().isEmpty)
    }

    func messageAdded(message: Message) {
        mMessages.append(message)
        mView.messageAdded()
    }
    
    func getMessageCount() -> Int {
        return mMessages.count
    }

    func getMessage(index:Int) -> Message {
        return mMessages[index]
    }
}
