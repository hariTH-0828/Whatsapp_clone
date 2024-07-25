//
//  BroadcaseView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 24/07/24.
//

import SwiftUI

struct BroadcaseView: View {
    
    var body: some View {
        VStack {
            Button(action: {
                if let url = URL(string: "itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/hariTH-0828/Hosting/main/ZohoFaciMap.plist") {
                    UIApplication.shared.open(url)
                }
            }, label: {
                Text("Install")
                    .foregroundStyle(.white)
                    .frame(height: 45)
                    .padding(.horizontal)
                    .background(
                        Color.green
                            .clipShape(.rect(cornerRadius: 20))
                    )
            })
        }
    }
}

#Preview {
    BroadcaseView()
}
