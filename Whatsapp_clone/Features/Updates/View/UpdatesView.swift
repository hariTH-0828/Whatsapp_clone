//
//  UpdatesView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

struct UpdatesView: View {
    @StateObject private var viewModel: UpdatesViewModel = UpdatesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                StatusTitleView()
                
                ChannelTitleView()
                    .padding(.top)
               
                Section {
                    ForEach(viewModel.allChannels, id: \.id) { channel in
                        ChannelListCell(channel)
                    }
                } header: {
                    VStack {
                        Text("updates.follow")
                            .font(.footnote).bold()
                            .foregroundStyle(Color(.darkGray))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .padding(.leading, 8)
                }
            }
            .navigationTitle("updates")
            .searchable(text: $viewModel.searchText)
            .scrollIndicators(.never)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button(action: {}, label: {
                            Label("Select channels", systemImage: "checkmark.circle")
                        })
                        Button(action: {}, label: {
                            Label("Create channel", image: .icoChannel)
                        })
                        Button(action: {}, label: {
                            Label("Status privacy", systemImage: "lock")
                        })
                    } label: {
                        Image(.icoMeetball)
                            .renderingMode(.template)
                            .defaultTabBarIcon()
                    }

                }
            })
        }
    }
    
    @ViewBuilder
    private func StatusTitleView() -> some View {
        HStack {
            Text("Status")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 22)
            
            Spacer()
            
            Image(systemName: "camera.fill")
                .font(.subheadline)
                .defaultTabBarIcon()
            
            Image(systemName: "pencil")
                .font(.subheadline)
                .defaultTabBarIcon()
                .padding(.trailing)
        }
        
        /// List all available status
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.fixed(30))], spacing: 20, content: {
                ForEach(1...10, id: \.self) { _ in
                    ProfileImageWithStatus(isViewed: true, numberOfSegments: 2)
                }
            })
            .padding(.horizontal)
        }
        .scrollIndicators(.never)
    }
    
    @ViewBuilder
    private func ChannelTitleView() -> some View {
        HStack {
            Text("updates.channel")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 22)
            
            Spacer()
            
            if !viewModel.followedChannels.isEmpty {
                Text("Explore")
                    .font(.callout)
                    .padding(.horizontal, 10)
                    .frame(height: 30)
                    .background(
                        Capsule()
                            .fill(.regularMaterial)
                    )
                    .padding(.horizontal)
            }
        }
        
        VStack {
            if viewModel.followedChannels.isEmpty {
                Text("updates.nochannel")
                    .foregroundStyle(Color(.secondaryLabel))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 22)
            }else {
                ForEach(viewModel.followedChannels, id: \.id) { channel in
                    ChannelListCell(channel)
                }
            }
        }
        
    }
    
    @ViewBuilder
    private func ChannelListCell(_ channel: Channel) -> some View {
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
                            .font(.headline).bold()
                        
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
                        viewModel.addToFollowed(channel)
                    }else { viewModel.unfollow(id: channel.id) }
                    
                }, label: {
                    Text(channel.isFollowed ? "Following" :  "Follow")
                        .defaultButtonStyle()
                })
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Divider()
                .offset(x: 90)
        }
    }
}

struct ProfileImageWithStatus: View {
    @State private var isViewed: Bool
    private var numberOfSegments: Int
    
    init(isViewed: Bool, numberOfSegments: Int) {
        self.isViewed = isViewed
        self.numberOfSegments = numberOfSegments
    }
    
    var body: some View {
        VStack {
            Image(.imageOne)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(.circle)
                .padding(4)
                .overlay {
                    Circle()
                        .fill(.clear)
                        .stroke(isViewed ? .gray : .green, style: StrokeStyle(lineWidth: 3,
                                                                              lineCap: .round,
                                                                              dash: [dashLength, gapLength]))
                }
                .padding(.vertical, 6)
            
            Text("My Status")
                .font(.footnote)
        }
    }
    
    private var dashLength: CGFloat {
        // The length of the dash
        return 100 / (CGFloat(numberOfSegments) / 2.0)
    }

    private var gapLength: CGFloat {
        // The length of the gap
        return numberOfSegments == 1 ? 1 : 5
    }
}

#Preview {
    UpdatesView()
}
