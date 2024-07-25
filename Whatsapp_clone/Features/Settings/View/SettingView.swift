//
//  SettingView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

struct SettingView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    profileCardView()
                }
                
                Section {
                    NavigationLink(destination: BroadcaseView()) {
                        Label(
                            title: { Text("Broadcase List") },
                            icon: {
                                Image(systemName: "megaphone")
                                    .renderingMode(.template)
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Starred Message")) {
                        Label(
                            title: { Text("Starred Messages") },
                            icon: {
                                Image(systemName: "star")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Linked Devices")) {
                        Label(
                            title: { Text("Linked Devices") },
                            icon: {
                                Image(systemName: "laptopcomputer")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                                    .symbolRenderingMode(.monochrome)
                            }
                        )
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Account")) {
                        Label(
                            title: { Text("Account") },
                            icon: {
                                Image(systemName: "key")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Privacy")) {
                        Label(
                            title: { Text("Privacy") },
                            icon: {
                                Image(systemName: "lock")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Chats")) {
                        Label(
                            title: { Text("Chats") },
                            icon: {
                                Image(systemName: "message")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Notifications")) {
                        Label(
                            title: { Text("Notifications") },
                            icon: {
                                Image(.icoNotifications)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Storage and Data")) {
                        Label(
                            title: { Text("Storage and Data") },
                            icon: {
                                Image(systemName: "arrow.up.arrow.down")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Help")) {
                        Label(
                            title: { Text("Help") },
                            icon: {
                                Image(systemName: "info.circle")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                    
                    NavigationLink(destination: Text("Tell a Friend")) {
                        Label(
                            title: { Text("Tell a Friend") },
                            icon: {
                                Image(systemName: "heart")
                                    .font(.callout)
                                    .foregroundStyle(StyleManager.colorStyle.primary)
                            }
                        )
                    }
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
        }
    }
    
    @ViewBuilder
    private func profileCardView() -> some View {
        VStack {
            HStack(spacing: 12, content: {
                Image(.imageThree)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    /// Name
                    Text("Ebineshan Washington")
                        .font(.system(.headline, weight: .medium))
                        .lineLimit(1)
                    
                    /// Status
                    Text("Hey there! I am using whatsapp.")
                        .font(.footnote)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Image(systemName: "qrcode")
                    .font(.callout)
                    .defaultTabBarIcon()
            })
        }
        
        NavigationLink(destination: EmptyView()) {
            Label(
                title: { Text("Avatar") },
                icon: {
                    Image(.icoAvatar)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(StyleManager.colorStyle.primary)
                }
            )
        }
    }
}

#Preview {
    SettingView()
}
