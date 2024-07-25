//
//  CommunityView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(.communitiesIllustration)
                    .resizable()
                    .frame(width: 180, height: 180, alignment: .center)
                
                Text("Stay connected with a community")
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("Communities bring members together in topic based groups. Any community you're added to will appear here.")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(StyleManager.colorStyle.appColor)
                        .frame(width: 345, height: 50)
                        .overlay {
                            HStack(spacing: 8) {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                    .bold()
                                
                                Text("New Community")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                    
                })
                .padding()
            }
            .navigationTitle("Communities")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.vertical)
        }
    }
}

#Preview {
    CommunityView()
}
