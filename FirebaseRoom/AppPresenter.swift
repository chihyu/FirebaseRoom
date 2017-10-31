//
//  AppPresenter.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/31.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class AppPresenter {
    
    let mLauncher: Launcher
    let mUserName: String
    
    init(launcher: Launcher, userName: String) {
        mLauncher = launcher
        mUserName = userName
    }

    func open() {
        if mUserName.isEmpty {
            mLauncher.goToInputNameView()
        } else {
            mLauncher.goToChatView()
        }
    }
}
