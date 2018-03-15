//
//  MessageViewController.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/12/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textAreaContainer: UIView!
    @IBOutlet weak var newMessageTextView: UITextView!
    
    // Declarations
    var senderId : String?
    var senderName: String?
    var chatRooms: [ChatRoom]?
    var selectedChatRoom: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderId = "0"
        senderName = "James Albert"
        configureView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBack()
    }

    func configureView() {
//        setPageTitle(title: "Messages")
        textAreaContainer.addShadow(color: .lightGray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 4)
        
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let newMessage = newMessageTextView.text, newMessage.count > 1 else {
            print("message empty")
            return
        }
        
        newMessageTextView.text = nil
        
        // Date Format
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMMM yyyy - EEEE"
        let formmattedDate = dateFormatter.string(from: date)
        
        // Preapre Message
        let message = Message()
        message.date = formmattedDate
        message.text = newMessage
        message.userId = senderId
        message.userName = senderName
        
        // Append new message
        self.selectedChatRoom?.messages.append(message)
        refreshForNewSendMessage()
    }
    
    func refreshForNewSendMessage() {
        
        if let messages = self.selectedChatRoom?.messages {
            
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: UITableViewRowAnimation.fade)
            tableView.endUpdates()
            scrollToBottom()
        }
    }
    
    func scrollToBottom() {
        
        DispatchQueue.main.async {
            
            if let messages = self.selectedChatRoom?.messages {
                
                let indexPath = IndexPath(row: messages.count-1, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MessageViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let messages = selectedChatRoom?.messages {
            
            return messages.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Validate
        guard let messages = selectedChatRoom?.messages else {
            return UITableViewCell()
        }
        
        guard let userId = messages[indexPath.row].userId else {
            // User - UnKnown
            return UITableViewCell()
        }
        
        // User - Me
        if userId == self.senderId {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessageSenderTableViewCell") as! MessageSenderTableViewCell
            cell.message = messages[indexPath.row]
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessageReceiverTableViewCell") as! MessageReceiverTableViewCell
            cell.message = messages[indexPath.row]
            return cell
        }
    }
}
