//
//  ModelMessage.swift
//  MySimpleChat
//
//  Created by Eric Grant on 29.08.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

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
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sentDate = data["created"] as? Timestamp else { return nil }
        guard let senderId = data["senderId"] as? String else { return nil }
        guard let senderUsername = data["senderUsername"] as? String else { return nil }
        guard let content = data["content"] as? String else { return nil }
        
        self.id = document.documentID
        self.sentDate = sentDate.dateValue()
        self.senderId = senderId
        self.senderUsername = senderUsername
        self.content = content
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
