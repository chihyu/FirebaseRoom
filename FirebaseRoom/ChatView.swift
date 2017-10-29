//
//  ChatView.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

protocol ChatView {
    func getInutMessage() -> String
    func cleanInputMessage()
    func messageAdded()
    func setButtonEnabled(enabled: Bool)
}
