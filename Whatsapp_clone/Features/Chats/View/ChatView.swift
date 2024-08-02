//
//  ChatsView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel = ChatViewModel()
    @State private var searchText: String = ""
    @State private var selectedFilter: Filters = .all
    @State private var showMoreUserInfo: Bool = false
    @State private var navigateToChat: Bool = false
    @State private var selectedUser: UserData?
    
    var body: some View {
        NavigationStack {
            List {
                FilterChips(selectedFilter: $selectedFilter)
                UserListView(viewModel: viewModel,
                             navigateToChat: $navigateToChat,
                             showMoreUserInfo: $showMoreUserInfo,
                             selectedUser: $selectedUser)
            }
            .listStyle(.plain)
            .listSectionSeparator(.hidden)
            .listSectionSeparatorTint(.clear)
            .navigationTitle("Chats")
            .searchable(text: $searchText, prompt: selectedFilter.searchPrompt)
            .toolbar(content: toolbarContent)
            .sheet(isPresented: $showMoreUserInfo, content: {
                MoreUserInfoBottomView(user: viewModel.selectedUser)
                    .presentationDetents([.height(480)])
            })
            .navigationDestination(item: $selectedUser) { user in
                Text("\(user.name) chat list")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
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
    }
}

fileprivate struct UserListView: View {
    @ObservedObject var viewModel: ChatViewModel
    @Binding var navigateToChat: Bool
    @Binding var showMoreUserInfo: Bool
    @Binding var selectedUser: UserData?
    
    var body: some View {
        ForEach(viewModel.users, id: \.self) { user in
            Button(action: {
                viewModel.setSelected(user: user)
                self.selectedUser = viewModel.selectedUser
                navigateToChat.toggle()
            }, label: {
                ChatListView(user: user)
            })
            .swipeActions(edge: .trailing) {
                swipeActionButtons(for: user)
            }
        }
    }
    
    @ViewBuilder
    func swipeActionButtons(for user: UserData) -> some View {
        Button(action: {}, label: {
            archiveboxIcon
                .foregroundStyle(StyleManager.colorStyle.backgroundColor)
        })
        .tint(StyleManager.colorStyle.appColor)
        
        Button(action: {
            viewModel.setSelected(user: user)
            showMoreUserInfo.toggle()
        }, label: {
            moreIcon
                .foregroundStyle(.white)
        })
        .tint(Color(.tertiaryLabel))
    }
}

#Preview {
    ContentView()
}
