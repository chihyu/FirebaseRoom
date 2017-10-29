//
//  ChatViewController.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChatView {

    @IBOutlet weak var mSendButton: UIButton!
    @IBOutlet weak var mInputMessageTextField: UITextField!
    @IBOutlet weak var mTableView: UITableView!
    var mPresenter:ChatPresenter!
    var ListArray: NSArray = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mPresenter = ChatPresenter(view: self, messageService: FirebaseMessageService(), userName: UserDefaults.standard.string(forKey: "name")!)
        mTableView.dataSource = self
        mTableView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "\(ListArray.object(at: indexPath.row))"
        return cell
    }
    
    @IBAction func inputMessageChanged(_ sender: Any) {
    }
    
    @IBAction func clickSendButton(_ sender: Any) {
        mPresenter.send()
    }
    
    func getInutMessage() -> String {
        return mInputMessageTextField.text ?? ""
    }
    
    func cleanInputMessage() {
        mInputMessageTextField.text = ""
    }
}
