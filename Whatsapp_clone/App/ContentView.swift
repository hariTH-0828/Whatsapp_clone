//
//  ContentView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

import SwiftUI

protocol TabItem {
    var tabName: String { get }
}

enum Tab: TabItem, CaseIterable {
    case updates
    case calls
    case communities
    case chats
    case setting
    
    var tabName: String {
        switch self {
        case .updates:
            return "Updates"
        case .calls:
            return "Calls"
        case .communities:
            return "Communities"
        case .chats:
            return "Chats"
        case .setting:
            return "Settings"
        }
    }
}

struct ContentView: View {
    @State private var selection: Tab = .chats
    
    init() {
        UITabBarItem.appearance().badgeColor = .systemGreen
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selection, content:  {
                UpdatesView()
                    .tabItem {
                        Label(
                            title: { Text(Tab.updates.tabName) },
                            icon: {
                                if selection == Tab.updates {
                                    Image(.icoStatusFill)
                                        .renderingMode(.template)
                                        .background(.red)
                                }else {
                                    Image(.icoStatus)
                                        .renderingMode(.template)
                                }
                            }
                        )
                    }.tag(Tab.updates)
                
                CallView()
                    .tabItem {
                        Label(
                            title: { Text(Tab.calls.tabName) },
                            icon: {
                                if selection == Tab.calls {
                                    Image(.icoCallsFill)
                                        .renderingMode(.template)
                                }else {
                                    Image(.icoCalls)
                                        .renderingMode(.template)
                                }
                            }
                        )
                    }.tag(Tab.calls)
                
                CommunityView()
                    .tabItem {
                        Label(
                            title: { Text(Tab.communities.tabName) },
                            icon: {
                                if selection == Tab.communities {
                                    Image(.icoCommunitiesFill)
                                        .renderingMode(.template)
                                }else {
                                    Image(.icoCommunities)
                                        .renderingMode(.template)
                                }
                            }
                        )
                    }.tag(Tab.communities)
                
                ChatsView()
                    .tabItem {
                        Label(
                            title: { Text(Tab.chats.tabName) },
                            icon: {
                                if selection == Tab.chats {
                                    Image(.icoChatsFill)
                                        .renderingMode(.template)
                                }else {
                                    Image(.icoChats)
                                        .renderingMode(.template)
                                }
                            }
                        )
                    }
                    .tag(Tab.chats)
                    .badge(5)
                
                SettingView()
                    .tabItem {
                        Label(
                            title: { Text(Tab.setting.tabName) },
                            icon: {
                                if selection == Tab.setting {
                                    Image(.icoSettingsFill)
                                        .renderingMode(.template)
                                }else {
                                    Image(.icoSettings)
                                        .renderingMode(.template)
                                }
                            }
                        )
                    }
                    .tag(Tab.setting)
            })
            .tint(StyleManager.colorStyle.primary)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.regularMaterial, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
