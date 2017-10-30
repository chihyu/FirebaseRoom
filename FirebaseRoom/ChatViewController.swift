//
//  ChatViewController.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation
import UIKit

class MessageCell : UITableViewCell {
    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mMessageLabel: UILabel!
    @IBOutlet weak var mDateLabel: UILabel!
}

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChatView, UITextFieldDelegate {

    private let INPUT_CONTAINER_BOTTOM_CONSTRAINT:CGFloat! = 10;
    private let BUTTON_ENABLED_ALPHA: CGFloat! = 1
    private let BUTTON_DISABLED_ALPHA: CGFloat! = 0.5
    
    @IBOutlet weak var mSendButton: UIButton!
    @IBOutlet weak var mInputMessageTextField: UITextField!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mInputContainer: UIStackView!
    @IBOutlet weak var mInputContainerBottomConstraint: NSLayoutConstraint!
    
    private var mPresenter: ChatPresenter!
    private var mKeyboardHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let messageService: MessageService = FirebaseMessageService()
        mPresenter = ChatPresenter(view: self, messageService: messageService, userName: UserDefaults.standard.string(forKey: "name")!)
        messageService.setMessageAddedDelegate(delegate: mPresenter)
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        mInputMessageTextField.delegate = self
        setButtonEnabled(enabled: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
   }
    
    @objc func keyboardShown(notification: NSNotification) {
        if let infoKey  = notification.userInfo?[UIKeyboardFrameEndUserInfoKey],
            let rawFrame = (infoKey as AnyObject).cgRectValue {
            let keyboardFrame = view.convert(rawFrame, from: nil)
            self.mKeyboardHeight = keyboardFrame.size.height
            UIView.animate(withDuration: 1.5, animations: {
                self.mInputContainerBottomConstraint.constant = keyboardFrame.size.height + self.INPUT_CONTAINER_BOTTOM_CONSTRAINT
                self.mInputContainer.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardHidden(notification: NSNotification) {
        if let infoKey  = notification.userInfo?[UIKeyboardFrameEndUserInfoKey],
            let rawFrame = (infoKey as AnyObject).cgRectValue {
            let keyboardFrame = view.convert(rawFrame, from: nil)
            self.mKeyboardHeight = keyboardFrame.size.height
            UIView.animate(withDuration: 1.5, animations: {
                self.mInputContainerBottomConstraint.constant = self.INPUT_CONTAINER_BOTTOM_CONSTRAINT
                self.mInputContainer.layoutIfNeeded()
            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mInputMessageTextField.resignFirstResponder() // Dismiss the keyboard
        mPresenter.send()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mPresenter.getMessageCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageCell

        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.mNameLabel!.text = mPresenter.getMessage(index: indexPath.row).mSender
        cell.mNameLabel!.layer.masksToBounds = true
        cell.mNameLabel!.layer.cornerRadius = 5
        cell.mMessageLabel!.text = mPresenter.getMessage(index: indexPath.row).mMessage
        cell.mDateLabel!.text = DateUtils.toDateTimeString(timestampInSec: mPresenter.getMessage(index: indexPath.row).mTimestampInSec)
        return cell
    }
    
    func messageAdded() {
        mTableView.reloadData()
        mTableView.scrollToRow(at: IndexPath(row: mPresenter.getMessageCount() - 1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
    }
    
    @IBAction func inputMessageChanged(_ sender: Any) {
        mPresenter.checkButtonEnabled()
    }
    
    @IBAction func clickSendButton(_ sender: Any) {
        mInputMessageTextField.resignFirstResponder()
        mPresenter.send()
    }
    
    func setButtonEnabled(enabled: Bool) {
        mSendButton.isEnabled = enabled
        mSendButton.alpha = enabled ? BUTTON_ENABLED_ALPHA : BUTTON_DISABLED_ALPHA
    }

    func getInputMessage() -> String {
        return mInputMessageTextField.text ?? ""
    }
    
    func cleanInputMessage() {
        mInputMessageTextField.text = ""
    }
}
