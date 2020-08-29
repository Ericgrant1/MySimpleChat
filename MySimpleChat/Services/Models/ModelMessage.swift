//
//  ModelMessage.swift
//  MySimpleChat
//
//  Created by Eric Grant on 29.08.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

struct ModelMessage: Hashable {
    
    let content: String
    let senderId: String
    let senderUsername: String
    var sentDate: Date
    let id: String?
    
    init(user: ModelUser, content: String) {
        self.content = content
        senderId = user.id
        senderUsername = user.username
        sentDate = Date()
        id = nil
    }
    
    var representation: [String: Any] {
        let rep: [String: Any] = [
            "created": sentDate,
            "senderId": sentDate,
            "senderName": senderUsername,
            "content": content
        ]
        return rep
    }
}
