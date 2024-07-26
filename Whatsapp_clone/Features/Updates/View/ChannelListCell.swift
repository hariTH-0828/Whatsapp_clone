//
//  ChannelListCell.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 26/07/24.
//

import SwiftUI

struct ChannelListCell: View {
    @EnvironmentObject private var viewModel: UpdatesViewModel
    var channel: Channel
    
    init(channel: Channel) {
        self.channel = channel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Image(channel.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 62, height: 62)
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 5) {
                        Text(channel.channelName)
                            .lineLimit(1)
                            .font(.callout).bold()
                        
                        if channel.verifiedChannel {
                            Image(.verifyBadge)
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                    Text("\(channel.channelFollowers) followers")
                        .font(.callout)
                        .foregroundStyle(Color(.secondaryLabel))
                }
                
                Spacer()
                
                Button(action: {
                    if !channel.isFollowed {
                        /// Follow
                        withAnimation(.smooth) {
                            viewModel.addToFollowed(channel: channel)
                        }
                    }else {
                        /// Unfollow
                        withAnimation(.smooth) {
                            viewModel.unfollow(channel: channel)
                        }
                    }
                    
                }, label: {
                    Text(channel.isFollowed ? "Following" : "Follow")
                        .defaultButtonStyle(isSelected: !channel.isFollowed)
                })
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ChannelListCell(channel: Channel(image: "keerthysuresh",
                                     channelName: "Keethy Suresh",
                                     channelFollowers: "55M",
                                     verifiedChannel: true,
                                     isFollowed: true))
}

