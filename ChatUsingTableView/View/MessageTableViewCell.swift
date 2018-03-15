//
//  MessageTableViewCell.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/12/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thumbNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var message: Message? {
        didSet{
            
            let names = (message?.userName ?? "?").split(separator: " ")
            var thumbName = "?"
            if names.count > 0 {
                if let firstLetter = names[0].first{
                    thumbName = "\(firstLetter)"
                }
                if names.count > 1, let secondLetter = names[names.count - 1].first{
                    thumbName += "\(secondLetter)"
                }
            }
            thumbNameLabel.text = thumbName
            dateLabel.text = message?.date ?? ""
            messageLabel.text = message?.text ?? ""
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        
        containerView.addShadow(color: .lightGray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 4)
    }


}

