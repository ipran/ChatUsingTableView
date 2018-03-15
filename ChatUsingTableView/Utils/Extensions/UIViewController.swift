//
//  UIViewController.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/14/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{
    

    //set page title
//    func setPageTitle(title: String, textColor: UIColor = .black) {
//        
//        self.navigationItem.title = title
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Lato-Regular", size: 18)!,NSAttributedStringKey.foregroundColor: textColor]
//        self.navigationController?.navigationBar.tintColor = UIColor.white
//    }
    
    // Push view custom navigation item
    func configureNavigationBack(_ color: UIColor = .black) {
        
        let image = UIImage(named: "navigation_arrow")!
        let navBarItem = UIBarButtonItem(image:image,  style: .plain, target: self, action: #selector(UIViewController.didTapNavigationBack))
        navigationItem.leftBarButtonItem = navBarItem
        navigationItem.leftBarButtonItem?.tintColor = color
    }
    // Page back Action
    @objc func didTapNavigationBack(){
        
        navigationController?.popViewController(animated: true)
    }
}
