//
//  ChatsView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

enum Filters: String, CaseIterable {
    case all = "All"
    case unread = "Unread"
    case favourite = "Favourites"
    case group = "Groups"
    
    var searchPrompt: String {
        switch self {
        case .all:
            return "Search"
        case .favourite:
            return "Search favourite chat"
        case .group:
            return "Search group chat"
        case .unread:
            return "Search unread chat"
        }
    }
}

struct ChatListView: View {
    @StateObject var viewModel: ChatViewModel = ChatViewModel()
    @State private var searchText: String = ""
    @State private var selectedFilter: Filters = .all
    @State private var showMoreUserInfo: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    HStack(spacing: 6, content: {
                        ForEach(Filters.allCases, id: \.self) { filter in
                            ChipViewBuilder(tab: filter, selection:  $selectedFilter)
                        }
                    })
                    .listRowSeparator(.hidden)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    ForEach(viewModel.users, id: \.name) { user in
                        ChatListView(user: user)
                            .swipeActions(edge: .trailing) {
                                Button(action: {}, label: {
                                    archiveboxIcon
                                        .foregroundStyle(StyleManager.colorStyle.backgroundColor)
                                })
                                .tint(StyleManager.colorStyle.appColor)
                                
                                Button(action: {
                                    viewModel.getMoreUserInfo(user)
                                    showMoreUserInfo.toggle()
                                }, label: {
                                    moreIcon
                                        .foregroundStyle(.white)
                                })
                                .tint(Color(.tertiaryLabel))
                            }
                    }
                }
            }
            .listStyle(.plain)
            .listSectionSeparator(.hidden)
            .listSectionSeparatorTint(.clear)
            .navigationTitle("Chats")
            .searchable(text: $searchText, prompt: selectedFilter.searchPrompt)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button("Select chat", systemImage: "checkmark.circle", action: {})
                    } label: {
                        Image(.icoMeetball)
                            .renderingMode(.template)
                            .defaultTabBarIcon()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(.icoCamera)
                            .renderingMode(.template)
                            .resizable()
                            .defaultTabBarIcon()
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(.icoPlus)
                            .renderingMode(.template)
                            .defaultTabBarIcon(bgColor: .green)
                    })
                }
            })
            .sheet(isPresented: $showMoreUserInfo, content: {
                MoreUserInfoBottomView(user: viewModel.moreUserInfo)
                    .presentationDetents([.height(480)])
            })
        }
    }
    
    @ViewBuilder
    func swipeActionButtons() -> some View {
        Button(action: {}, label: {
            archiveboxIcon
                .foregroundStyle(StyleManager.colorStyle.backgroundColor)
        })
        .tint(StyleManager.colorStyle.appColor)
        
        Button(action: {
            showMoreUserInfo.toggle()
        }, label: {
            moreIcon
                .foregroundStyle(.white)
        })
        .tint(Color(.tertiaryLabel))
    }
}

fileprivate struct ChatListView: View {
    let user: UserData
    
    init(user: UserData) {
        self.user = user
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(user.profilePicture)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                HStack {
                    /// Username
                    Text(user.name)
                        .foregroundStyle(StyleManager.colorStyle.primary)
                        .font(.headline)
                    
                    Spacer()
                    
                    /// Last Message Time
                    Text(user.message.messageTime)
                        .foregroundStyle(Color(.secondaryLabel))
                        .font(.system(.footnote, design: .default, weight: .light))
                }
                
                Text(user.message.message)
                    .lineLimit(2)
                    .foregroundStyle(Color(.secondaryLabel))
                    .font(.footnote)
                    .padding(.trailing)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}
