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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MyChat, rhs: MyChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
