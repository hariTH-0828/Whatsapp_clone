//
//  UpdatesView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

struct UpdatesView: View {
    @StateObject private var viewModel: UpdatesViewModel = UpdatesViewModel()
    @State private var followedChannels = [Channel]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                StatusTitleView()
                
                ChannelTitleView()
                    .padding(.top)
                
                ChannelSuggestion()
            }
            .navigationTitle("updates")
            .searchable(text: $viewModel.searchText)
            .environmentObject(viewModel)
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
            .onReceive(viewModel.$allChannels, perform: { channels in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation(.snappy) {
                        followedChannels = viewModel.allChannels.filter({ $0.isFollowed == true})
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
            
            if !viewModel.allChannels.allSatisfy({$0.isFollowed == false}) {
                Text("Explore")
                    .font(.system(.footnote, weight: .semibold))
                    .padding(.horizontal, 10)
                    .frame(height: 26)
                    .background(
                        Capsule()
                            .fill(.regularMaterial)
                    )
                    .padding(.horizontal)
            }
        }
        
        VStack {
            if viewModel.allChannels.allSatisfy({$0.isFollowed == false}) {
                Text("updates.nochannel")
                    .foregroundStyle(Color(.secondaryLabel))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 22)
            }else {
                /// List All Followed Channels
                ForEach(followedChannels, id: \.self) { channel in
                    ChannelListCell(channel: channel)
                }
            }
        }
        
    }
    
    @ViewBuilder
    private func ChannelSuggestion() -> some View {
        Section {
            ForEach((viewModel.getAllChannelAsList().prefix(5)).indices, id: \.self) { index in
                ChannelListCell(channel: viewModel.getAllChannelAsList()[index])
                if index != 4 {
                    Divider()
                        .offset(x: 90)
                }
            }
            
            Button(action: {}, label: {
                Text("Explore more")
                    .foregroundStyle(.background)
                    .frame(height: 35)
                    .padding(.horizontal)
                    .background(
                        Capsule()
                            .fill(StyleManager.colorStyle.appColor)
                    )
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
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
                .frame(width: 60, height: 60)
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


extension Set {
    func firstRange(of count: Int) -> ArraySlice<Element> {
        return Array(self.prefix(count))[0..<Swift.min(count, self.count)]
    }
}
