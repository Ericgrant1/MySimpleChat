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
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MyChat, rhs: MyChat) -> Bool {
        return lhs.id == rhs.id
    }
}
