//
//  Channel.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 25/07/24.
//

import Foundation

struct Channel {
    let id = UUID()
    var image: String
    var channelName: String
    var channelFollowers: String
    var verifiedChannel: Bool
    var isFollowed: Bool = false
}
