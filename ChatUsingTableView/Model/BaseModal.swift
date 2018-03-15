//
//  BaseModal.swift
//  samms
//
//  Created by Sattin on 07/03/18.
//  Copyright © 2018 netrix. All rights reserved.
//

import Foundation

/* Provide Safe UnWrapping */
@objcMembers
class Base: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        let uppercasedFirstCharacter = String(key.first!).uppercased()
        let range = NSMakeRange(0, 1)
        let selectorString = NSString(string: key).replacingCharacters(in: range, with: uppercasedFirstCharacter)
        
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {
            return
        }
        super.setValue(value, forKey: key)
    }
    
}
