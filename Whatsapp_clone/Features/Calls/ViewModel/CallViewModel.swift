//
//  CallViewModel.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 23/07/24.
//

import SwiftUI

class CallViewModel: ObservableObject {
    
    @Published var callLogs = [RecentCallLogs]()
    
    init() {
        callLogs = [
            RecentCallLogs(name: "Hariharan", call: .incoming, type: .voice, day: .friday, image: .imageOne),
            RecentCallLogs(name: "Sachin", call: .incoming, type: .voice, day: .friday, image: .imageFour),
            RecentCallLogs(name: "Shalini", call: .outgoing, type: .face, day: .saturday, image: .imageTwo),
            RecentCallLogs(name: "Preethi", call: .outgoing, type: .face, day: .sunday, image: .imageFive),
            RecentCallLogs(name: "Balasuriya", call: .incoming, type: .face, day: .monday, image: .imageThree),
            RecentCallLogs(name: "Hariharan", call: .incoming, type: .voice, day: .tuesday, image: .imageOne),
            RecentCallLogs(name: "Sachin", call: .incoming, type: .voice, day: .wednesday, image: .imageFour),
            RecentCallLogs(name: "Preethi", call: .outgoing, type: .face, day: .thursday, image: .imageFive),
            RecentCallLogs(name: "Balasuriya", call: .incoming, type: .voice, day: .thursday, image: .imageThree),
            RecentCallLogs(name: "Preethi", call: .outgoing, type: .face, day: .saturday, image: .imageFive)
        ]
    }
    
    func delete(at offsets: IndexSet) {
        callLogs.remove(atOffsets: offsets)
    }
}

