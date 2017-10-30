//
//  MockInputNameView.swift
//  FirebaseRoomTests
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class MockInputNameView: InputNameView {
    
    var mInputName: String? = ""
    var mEnabled: Bool = false
    
    func getInputName() -> String {
        return mInputName ?? ""
    }
    
    func setGoButtonEnabled(enabled:Bool) {
        mEnabled = enabled
    }
}
