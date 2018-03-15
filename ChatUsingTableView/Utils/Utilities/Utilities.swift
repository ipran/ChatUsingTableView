//
//  Utilities.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/14/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import Foundation
import UIKit


// Generate Random Color
func getRandomColor() -> UIColor {
    
    let randomRed: CGFloat = CGFloat(drand48())
    let randomGreen: CGFloat = CGFloat(drand48())
    let randomBlue: CGFloat = CGFloat(drand48())
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
}
