//
//  MyChat.swift
//  MySimpleChat
//
//  Created by Eric Grant on 02.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MyChat, rhs: MyChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
