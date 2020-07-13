//
//  ModelUser.swift
//  MySimpleChat
//
//  Created by Eric Grant on 02.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

struct ModelUser: Hashable, Decodable {
    var username: String
    var email: String
    var avatarImageString: String
    var description: String
    var sex: String
    var id: String
    
    var representation: [String: Any] {
        var rep = ["username": username]
        rep["email"] = email
        rep["avatarImageString"] = avatarImageString
        rep["description"] = description
        rep["sex"] = sex
        rep["uid"] = id
        
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ModelUser, rhs: ModelUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
