//
//  MyChat.swift
//  MySimpleChat
//
//  Created by Eric Grant on 02.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

struct MyChat: Hashable, Decodable {
    var friendUsername: String
    var friendImageStringURL: String
    var lastMessageContent: String
    var friendId: String
    
    var representation: [String: Any] {
        var rep = ["friendUsername": friendUsername]
        rep["friendImageStringURL"] = friendImageStringURL
        rep["lastMessage"] = lastMessageContent
        rep["friendId"] = friendId
        return rep
    }
    
    init(friendUsername: String, friendImageStringURL: String, lastMessageContent: String, friendId: String) {
        self.friendUsername = friendUsername
        self.friendImageStringURL = friendImageStringURL
        self.lastMessageContent = lastMessageContent
        self.friendId = friendId
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let friendUsername = data["friendUsername"] as? String,
        let friendImageStringURL = data["friendImageStringURL"] as? String,
        let lastMessageContent = data["lastMessage"] as? String,
        let friendId = data["friendId"] as? String else { return nil }
        
        self.friendUsername = friendUsername
        self.friendImageStringURL = friendImageStringURL
        self.lastMessageContent = lastMessageContent
        self.friendId = friendId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MyChat, rhs: MyChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
