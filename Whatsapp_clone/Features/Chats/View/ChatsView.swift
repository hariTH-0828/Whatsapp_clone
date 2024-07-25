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

struct ChatsView: View {
    @State private var searchText: String = ""
    @State private var selectedFilter: Filters = .all
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 12) {
                        HStack(spacing: 6, content: {
                            ForEach(Filters.allCases, id: \.self) { filter in
                                ChipViewBuilder(tab: filter, selection:  $selectedFilter)
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 22)
                        
                        ForEach(0..<30, id: \.self) { _ in
                            ChatListView()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
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
        }
    }
}

fileprivate struct ChatListView: View {
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(.imageOne)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 55, height: 55)
                    .clipShape(.circle)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack {
                    /// Username and Last Message Time
                    HStack {
                        /// Username
                        Text("Balasuriya")
                            .foregroundStyle(.primary)
                            .font(.headline)
                        
                        Spacer()
                        
                        /// Last Message Time
                        Text("12:35 PM")
                            .foregroundStyle(Color(.secondaryLabel))
                            .font(.system(.footnote, design: .default, weight: .light))
                    }
                    .padding(.trailing)
                    
                    HStack {
                        /// Last Message
                        Text("You reacted 🤣 to \("...ketchup!")")
                            .foregroundStyle(Color(.secondaryLabel))
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            
            Divider()
                .offset(x: 65)
        }
        .frame(height: 65)
        .padding(.horizontal)
    }
}

#Preview {
    ChatsView()
//    ChatListView()
}
