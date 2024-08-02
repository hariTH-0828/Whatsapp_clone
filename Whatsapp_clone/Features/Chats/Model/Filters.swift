//
//  Filters.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 02/08/24.
//

import Foundation

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
