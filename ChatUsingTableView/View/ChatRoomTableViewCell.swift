//
//  ChatRoomTableViewCell.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/12/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var chatThumbNameLabel: UILabel!
    @IBOutlet weak var chatNameLabel: UILabel!
    
    var chatRoom: ChatRoom? {
        didSet {
            chatNameLabel.text = chatRoom?.name
            
            // prepare thumb name
            let names = (chatRoom?.name ?? "?").split(separator: " ")
            var thumbName = "?"
            if names.count > 0 {
                if let firstLetter = names[0].first {
                    thumbName = "\(firstLetter)"
                }
                if names.count > 1, let secondLetter = names[names.count - 1].first{
                    thumbName += "\(secondLetter)"
                }
            }
            chatThumbNameLabel.text = thumbName
            chatThumbNameLabel.backgroundColor = getRandomColor()
            chatThumbNameLabel.layer.cornerRadius = 2
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        
        containerView.addShadow(color: .lightGray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
