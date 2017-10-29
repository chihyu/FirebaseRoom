//
//  ChatPresenter.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class ChatPresenter {

    let mView: ChatView
    let mMessageService: MessageService
    let mUserName: String
    var nameUserDefaults :UserDefaults!
    
    init(view: ChatView, messageService: MessageService, userName: String) {
        mView = view
        mMessageService = messageService
        mUserName = userName
        nameUserDefaults = UserDefaults.standard
    }

    func send() {
        mMessageService.sendMessage(sender: mUserName, message: mView.getInutMessage(), timestamp: Int(NSDate().timeIntervalSince1970 * 1000.0))
        mView.cleanInputMessage()
    }
}
