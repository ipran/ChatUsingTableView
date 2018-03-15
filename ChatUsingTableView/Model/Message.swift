//
//  Message.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/13/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class Message: Base {
    
    var userId: String?
    var userName: String?
    var text: String?
    var date: String?
    
    override init() {
        super.init()
    }
    
    init(_ values: Dictionary<String, Any>) {
        super.init()
        setValuesForKeys(values)
    }

}
