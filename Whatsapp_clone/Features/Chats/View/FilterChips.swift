//
//  FilterChips.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 02/08/24.
//

import SwiftUI

struct FilterChips: View {
    @Binding var selectedFilter: Filters
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(Filters.allCases, id: \.self) { filter in
                ChipViewBuilder(tab: filter, selection: $selectedFilter)
            }
        }
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
