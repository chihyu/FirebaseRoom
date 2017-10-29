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
    
    required init(view: InputNameView) {
        self.mView = view
    }
    
    func checkGoButtonEnabled() {
        mView.setGoButtonEnabled(enabled: !mView.getInputName().isEmpty)
    }
}
