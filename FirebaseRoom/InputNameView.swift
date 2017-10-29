//
//  InputNameView.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

public protocol InputNameView {
    func getInputName() -> String
    func setGoButtonEnabled(enabled:Bool)
}
