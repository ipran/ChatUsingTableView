//
//  ViewController.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/12/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var chatRooms = [ChatRoom]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
//        hideNavigation()
        loadUsers()
    }
    
    func hideNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }
    func loadUsers() {
        chatRooms = ChatRoomService.shared.chatRooms
        tableView.reloadData()
    }
    
    func configureView() {
//        setPageTitle(title: "Messages")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension ChatRoomViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatRoomTableViewCell") as! ChatRoomTableViewCell
        cell.chatRoom = chatRooms[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let messageVC = storyboard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        messageVC.selectedChatRoom = self.chatRooms[indexPath.row]
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    
}
