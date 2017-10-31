//
//  MocikLauncher.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/31.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class MockLauncher: Launcher {
    
    private var mGoToInputNameViewCalled: Bool = false
    private var mGoToChatViewCalled: Bool = false
    
    func goToInputNameView() {
        mGoToInputNameViewCalled = true
    }
    
    func goToChatView() {
        mGoToChatViewCalled = true
    }

    public func isGoToInputNameViewCalled() -> Bool {
        return mGoToInputNameViewCalled
    }

    public func isGoToChatViewCalled() -> Bool {
        return mGoToChatViewCalled
    }
}
