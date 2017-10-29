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

    @IBOutlet weak var mSendButton: UIButton!
    @IBOutlet weak var mInputMessageTextField: UITextField!
    @IBOutlet weak var mTableView: UITableView!
    var mPresenter:ChatPresenter!
    var mMessages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let messageService: MessageService = FirebaseMessageService()
        mPresenter = ChatPresenter(view: self, messageService: messageService, userName: UserDefaults.standard.string(forKey: "name")!)
        messageService.setMessageAddedDelegate(delegate: mPresenter)
        mTableView.dataSource = self
        mTableView.delegate = self
        mInputMessageTextField.delegate = self
        setButtonEnabled(enabled: false)
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

        cell.mNameLabel!.text = mPresenter.getMessage(index: indexPath.row).mSender
        cell.mNameLabel!.layer.masksToBounds = true
        cell.mNameLabel!.layer.cornerRadius = 5
        cell.mMessageLabel!.text = mPresenter.getMessage(index: indexPath.row).mMessage
        cell.mDateLabel!.text = mPresenter.getMessage(index: indexPath.row).getDate()
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
        mPresenter.send()
    }
    
    func setButtonEnabled(enabled: Bool) {
        mSendButton.isEnabled = enabled
        mSendButton.alpha = enabled ? 1 : 0.5
    }

    func getInutMessage() -> String {
        return mInputMessageTextField.text ?? ""
    }
    
    func cleanInputMessage() {
        mInputMessageTextField.text = ""
    }
}
