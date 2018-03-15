//
//  ChatRoomService.swift
//  ChatUsingTableView
//
//  Created by Pranil on 3/13/18.
//  Copyright © 2018 pranil. All rights reserved.
//

import UIKit

class ChatRoomService: NSObject {

    static var shared = ChatRoomService()
    var chatRooms = [ChatRoom]()
    
    override init() {
        super.init()
        self.getMessages()
    }
    
    func getMessages() {
        let chatRooms = [
            ["roomId": "1", "name":"Barry Allen", "messages": [
                ["userId": "0", "text": "For instance, researchers have found that germ-free mice that had been deprived of beneficial gut bacteria displayed symptoms", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "1", "text": "Since the bacteria in our gut can alter the function of our brain by producing certain hormones.", "date": "29, December 2017 - Tuesday", "userName": "Barry Allen"],
                ["userId": "0", "text": "Other studies have not only pinpointed specific bacteria whose absence can trigger symptoms of depression in rodents.", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "1", "text": "Now, an observational study suggests that proton pump inhibitors.", "date": "29, December 2017 - Tuesday", "userName": "Barry Allen"]]],
            
            ["roomId": "2", "name":"James Albert", "messages": [
                ["userId": "0", "text": "Huang and team examined data on 2,366 individuals who had been taking proton pump inhibitors.", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "2", "text": "The researchers applied logistic regression analysis and adjusted for various demographic factors.", "date": "29, December 2017 - Tuesday", "userName": "Jacob Pual"],
                ["userId": "0", "text": "Explore the history of the classic Lorem Ipsum passage and generate your own text using any number of characters, words.", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "2", "text": "Explore the history of the classic Lorem Ipsum passage and generate your own text using any number of characters, words.", "date": "29, December 2017 - Tuesday", "userName": "Miranda Tates"]]],
            
            ["roomId": "3", "name":"Bruce Wayne", "messages": [
                ["userId": "3", "text": "Explore the history of the classic Lorem Ipsum passage and generate your own text using any number of characters, words.", "date": "29, December 2017 - Tuesday", "userName": "Bruce Wayne"],
                ["userId": "0", "text": "Explore the history of the classic Lorem Ipsum passage and generate your own text using any number of characters, words.", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "3", "text": "Explore the history of the classic Lorem Ipsum passage and generate your own text using any number of characters, words.", "date": "29, December 2017 - Tuesday", "userName": "Bruce Wayne"],
                ["userId": "0", "text": "Explore the history of the classic Lorem Ipsum passage and generate your own text using any number of characters, words.", "date": "29, December 2017 - Tuesday", "userName": "James Albert"]]],
            
            ["roomId": "4", "name":"Will Turner", "messages": [
                ["userId": "4", "text": "Explore the history of the classics.", "date": "29, December 2017 - Tuesday", "userName": "Will Turner"],
                ["userId": "0", "text": "generate your own characters..", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "0", "text": "classic heroic characters..", "date": "29, December 2017 - Tuesday", "userName": "James Albert"],
                ["userId": "4", "text": "I do, Thank you.", "date": "29, December 2017 - Tuesday", "userName": "Will Smith"]]]
        ]
        
        self.chatRooms = chatRooms.map({return ChatRoom($0)})
        
    }
    
}
