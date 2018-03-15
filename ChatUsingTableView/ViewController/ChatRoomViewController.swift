//
//  ViewController.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/12/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigation()
    }
    
    func hideNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

