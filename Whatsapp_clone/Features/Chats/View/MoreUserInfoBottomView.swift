//
//  MoreUserInfoBottomView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 01/08/24.
//

import SwiftUI

struct MoreUserInfoBottomView: View {
    @Environment(\.dismiss) private var dismiss
    var user: UserData = UserData.defaultValue()
    
    init(user: UserData?) {
        if let user = user {
            self.user = user
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            headerNameView(user)
                .padding(.horizontal)
            
            VStack {
                optionRow(icon: "bell.slash", title: "Mute")
                optionRow(icon: "info.circle", title: "Contact info")
                optionRow(icon: "lock", title: "Lock chat")
                optionRow(icon: "xmark.circle", title: "Clear chat")
                optionRow(icon: "heart", title: "Add to Favourites", false)
            }
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 15.0).fill(.regularMaterial))
            .padding(.horizontal)
            
            VStack {
                optionRow(icon: "hand.raised.fill", title: "Block \(user.name)", titleColor: .red)
                optionRow(icon: "trash", title: "Delete chat", titleColor: .red, false)
            }
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 15.0).fill(.regularMaterial))
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
    }
    
    @ViewBuilder
    func headerNameView(_ user: UserData) -> some View {
        HStack(spacing: 12) {
            Image(user.profilePicture)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
            
            Text(user.name)
                .foregroundStyle(StyleManager.colorStyle.primary)
                .font(.headline)
            
            Spacer()
            
            Button(action: { dismiss.callAsFunction() }, label: {
                Circle()
                    .fill(.regularMaterial)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(.icoClose)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(StyleManager.colorStyle.closeGray)
                            .aspectRatio(contentMode: .fit)
                            .padding(4)
                    }
            })
        }
    }
    
    @ViewBuilder
    func optionRow(icon: String,
                   title: String,
                   titleColor: Color = StyleManager.colorStyle.primary, _ dividerVisibility: Bool = true) -> some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(titleColor)
                    .font(.system(size: 16, weight: .regular))
                Spacer()
                Image(systemName: icon)
                    .foregroundColor(titleColor)
                    .font(.system(size: 20, weight: .regular))
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        
        if dividerVisibility {
            Divider()
                .offset(x: 18)
                .clipped()
        }
    }
}
