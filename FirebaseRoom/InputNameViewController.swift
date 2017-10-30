//
//  ViewController.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import UIKit

class InputNameViewController: UIViewController, InputNameView {
    
    private let GO_BUTTON_ENABLED_ALPHA: CGFloat = 1
    private let GO_BUTTON_DISABLED_ALPHA: CGFloat = 0.5
    
    @IBOutlet weak var mGoButton: UIButton!
    @IBOutlet weak var mInputNameTextField: UITextField!
    
    private var mInputNamePresenter:InputNamePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mInputNamePresenter = InputNamePresenter(view: self)
        setGoButtonEnabled(enabled: false)
        mInputNameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getInputName() -> String {
        return mInputNameTextField.text ?? ""
    }
    
    func setGoButtonEnabled(enabled:Bool) {
        mGoButton.isEnabled = enabled
        mGoButton.alpha = enabled ? GO_BUTTON_ENABLED_ALPHA : GO_BUTTON_DISABLED_ALPHA
    }
    
    @IBAction func inputNameChanged(_ sender: Any) {
        mInputNamePresenter.checkGoButtonEnabled()
    }

    @IBAction func clickGo(_ sender: Any) {
        mInputNamePresenter.go()
    }
}

