//
//  UpdatesViewModel.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 25/07/24.
//

import SwiftUI

class UpdatesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published private(set) var allChannels = Set<Channel>()
    
    init() {
        loadAllChannels()
    }
    
    private func loadAllChannels() {
        self.allChannels = [
            Channel(image: "whatsapp2", channelName: "Whatsapp", channelFollowers: "172M", verifiedChannel: true, isFollowed: false),
            Channel(image: "Timcook", channelName: "Tim Cook", channelFollowers: "180M", verifiedChannel: true, isFollowed: false),
            Channel(image: "BillGates", channelName: "Bill Gates", channelFollowers: "65M", verifiedChannel: true, isFollowed: false),
            Channel(image: "ajithkumar", channelName: "Ajith kumar", channelFollowers: "70M", verifiedChannel: false, isFollowed: false),
            Channel(image: "priyabhavanishankar", channelName: "Priya Bhavani Shankar", channelFollowers: "60M", verifiedChannel: true, isFollowed: true),
            Channel(image: "sivakarthikeyan", channelName: "Sivakarthikeyan", channelFollowers: "80M", verifiedChannel: true, isFollowed: false),
            Channel(image: "keerthysuresh", channelName: "Keerthy Suresh", channelFollowers: "60M", verifiedChannel: true, isFollowed: false)
        ]
    }
    
    func addToFollowed(channel: Channel) {
        updateFollower(channel: channel, isFollowed: true)
    }
    
    func unfollow(channel: Channel) {
        updateFollower(channel: channel, isFollowed: false)
    }
    
    func getAllChannelAsList() -> [Channel] {
        return self.allChannels.sorted(by: { $0.channelName < $1.channelName })
    }
    
    private func updateFollower(channel: Channel, isFollowed: Bool) {
        if let foundChannel = allChannels.first(where: { $0 == channel }) {
            foundChannel.isFollowed = isFollowed
            allChannels.update(with: foundChannel)
        }
    }
}
