//
//  ChatRoom.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/13/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class ChatRoom: Base {
    var roomId: String?
    var name: String?
    var messages = [Message]()

    override init() {
        super.init()
    }
    
    init(_ values: Dictionary<String, Any>){
        super.init()
        setValuesForKeys(values)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        switch key {
            
        case "messages":
            if let _message = value as? Array<Dictionary<String, Any>> {
                self.messages = _message.map({ Message($0) })
            }
            break
        default:
            super.setValue(value, forKey: key)
            
        }
    }
}
