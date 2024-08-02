//
//  ChatListView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 02/08/24.
//

import SwiftUI

struct ChatListView: View {
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
