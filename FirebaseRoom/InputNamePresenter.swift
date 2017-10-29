//
//  InputNamePresenter.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class InputNamePresenter {

    let mView:InputNameView
    var nameUserDefaults :UserDefaults!
    
    required init(view: InputNameView) {
        self.mView = view
        nameUserDefaults = UserDefaults.standard
    }
    
    func checkGoButtonEnabled() {
        nameUserDefaults.set(mView.getInputName(), forKey: "name")
        nameUserDefaults.synchronize()
        mView.setGoButtonEnabled(enabled: !mView.getInputName().isEmpty)
    }
}
