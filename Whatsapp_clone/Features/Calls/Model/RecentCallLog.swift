//
//  RecentCallLog.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 23/07/24.
//

import SwiftUI

enum SegmentTabs: String {
    case all = "All"
    case missed = "Missed"
}

enum Days: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = " Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

enum CallType: String {
    case voice = "Voice"
    case face = "Face"
}

enum Call: String {
    case incoming = "Incoming"
    case outgoing = "Outgoing"
}

struct RecentCallLogs {
    var id = UUID()
    var name: String
    var call: Call
    var type: CallType
    var day: Days
    var image: ImageResource
}
