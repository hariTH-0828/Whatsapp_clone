//
//  ChipViewBuilder.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 22/07/24.
//

import SwiftUI

struct ChipViewBuilder: View {
    private var tab: Filters
    @Binding private var selection: Filters
    @Namespace private var animate
    
    init(tab: Filters, selection: Binding<Filters>) {
        self.tab = tab
        self._selection = selection
    }
    
    var body: some View {
        Button(action: {
            withAnimation(.snappy) {
                selection = tab
            }
        }, label: {
            Text(tab.rawValue)
                .foregroundStyle(tab == selection ? StyleManager.colorStyle.chipForeground : Color(uiColor: .darkGray))
                .font(.footnote).bold()
                .padding(.horizontal)
                .frame(height: 32)
                .background {
                    if selection == tab {
                        Capsule()
                            .fill(StyleManager.colorStyle.chipBackground)
                            .matchedGeometryEffect(id: "ACTIVECHIP", in: animate)
                    }else {
                        Capsule()
                            .fill(StyleManager.colorStyle.chipUnselectBackground)
                            .matchedGeometryEffect(id: "ACTIVECHIP", in: animate)
                    }
                }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
