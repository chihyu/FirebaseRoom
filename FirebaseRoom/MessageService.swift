//
//  MessageService.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

protocol MessageService {
    func sendMessage(sender:String, message:String, timestamp:Int)
    func setMessageAddedDelegate(delegate:MessageAddedDelegate)
}

protocol MessageAddedDelegate {
    func messageAdded(message: Message)
}
