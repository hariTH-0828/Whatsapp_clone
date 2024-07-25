//
//  UpdatesViewModel.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 25/07/24.
//

import Foundation


class UpdatesViewModel: ObservableObject {
    @Published var searchText: String = ""
    
    @Published private(set) var followedChannels = [Channel]()
    @Published private(set) var allChannels = [Channel]()
    
    init() {
        loadAllChannels()
    }
    
    private func loadAllChannels() {
        self.allChannels = [
            Channel(image: "whatsapp2", channelName: "Whatsapp", channelFollowers: "172M", verifiedChannel: true),
            Channel(image: "Timcook", channelName: "Tim Cook", channelFollowers: "180M", verifiedChannel: true),
            Channel(image: "BillGates", channelName: "Bill Gates", channelFollowers: "65M", verifiedChannel: true),
            Channel(image: "ajithkumar", channelName: "Ajith kumar", channelFollowers: "70M", verifiedChannel: false),
            Channel(image: "priyabhavanishankar", channelName: "Priya Bhavani Shankar", channelFollowers: "60M", verifiedChannel: true),
            Channel(image: "sivakarthikeyan", channelName: "Sivakarthikeyan", channelFollowers: "80M", verifiedChannel: true),
            Channel(image: "keerthysuresh", channelName: "Keerthy Suresh", channelFollowers: "60M", verifiedChannel: true)
        ]
    }
    
    func addToFollowed(_ channel: Channel) {
        self.followedChannels.append(channel)
    }
    
    func unfollow(id: UUID) {
        var channel = allChannels.first(where: {$0.id == id} )
        channel?.isFollowed.toggle()
    }
}
