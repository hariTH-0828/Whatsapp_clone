//
//  Channel.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 25/07/24.
//

import Foundation

struct Message {
    var message: String
    var messageTime: String
    var isReaded: Bool
}

class Channel: Hashable {
    var image: String
    var channelName: String
    var channelFollowers: String
    var verifiedChannel: Bool
    var isFollowed: Bool
    var message: [Message]?
    
    init(image: String, channelName: String, channelFollowers: String, verifiedChannel: Bool, isFollowed: Bool) {
        self.image = image
        self.channelName = channelName
        self.channelFollowers = channelFollowers
        self.verifiedChannel = verifiedChannel
        self.isFollowed = isFollowed
    }
    
    static func == (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.channelName == rhs.channelName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(channelName)
    }
}
