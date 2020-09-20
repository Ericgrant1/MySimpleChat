//
//  WaitingChatsNavigation.swift
//  MySimpleChat
//
//  Created by Eric Grant on 20.09.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation

protocol WaitingChatsNavigation: class {
    func removeWaitingChat(chat: MyChat)
    func chatToActive(chat: MyChat)
}
