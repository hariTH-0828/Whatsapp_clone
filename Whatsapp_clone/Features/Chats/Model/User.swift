//
//  User.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 23/07/24.
//

import Foundation

struct UserData {
    let name: String
    let profilePicture: String
    let phoneNumber: String
    let about: About
    let message: Message
    let status: Status
    
    static func defaultValue() -> UserData {
        UserData(name: "", profilePicture: "", phoneNumber: "", about: About(about: "", lastUpdateAt: ""), message: Message(message: "", messageTime: "", isReaded: false), status: Status(isStatusAvailable: false))
    }
}

struct About {
    let about: String
    let lastUpdateAt: String
}

struct Status {
    let isStatusAvailable: Bool
    let statusCount: Int?
    let isStatusViewed: Bool?
    
    init(isStatusAvailable: Bool, statusCount: Int? = nil, isStatusViewed: Bool? = nil) {
        self.isStatusAvailable = isStatusAvailable
        self.statusCount = statusCount
        self.isStatusViewed = isStatusViewed
    }
}
