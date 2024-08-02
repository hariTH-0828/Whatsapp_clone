//
//  ChatViewModel.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 01/08/24.
//

import Foundation


class ChatViewModel: ObservableObject {
    @Published var users: [UserData] = []
    @Published private(set) var moreUserInfo: UserData? = nil
    
    init() {
        initiateUsers()
    }
    
    private func initiateUsers() {
        let balasuriya = UserData(name: "Balasuriya 🙈",
                                    profilePicture: "imageOne",
                                    phoneNumber: "+91 96543 13024",
                                    about: About(about: "Humanity 😇✨❤️", lastUpdateAt: "2 May 2022"),
                                    message: Message(message: "This is some awesome thinking!", messageTime: "Yesterday", isReaded: true),
                                    status: Status(isStatusAvailable: true, statusCount: 3, isStatusViewed: false))
        
        let aarthi = UserData(name: "Aarthi ❤️",
                                    profilePicture: "imageTwo",
                                    phoneNumber: "+91 91065 22785",
                                    about: About(about: "😇Accept u'r Life as it is❤️", lastUpdateAt: "3 Feb 2022"),
                                    message: Message(message: "Are you mad? 🧐", messageTime: "Friday", isReaded: true),
                                    status: Status(isStatusAvailable: true, statusCount: 1, isStatusViewed: true))
        
        let ramachandran = UserData(name: "Ramachandran",
                                    profilePicture: "imageThree",
                                    phoneNumber: "+91 81495 89364",
                                    about: About(about: "🌎Love the world❤️ Don't trust anyone expect Mom", lastUpdateAt: "22 May 2023"),
                                    message: Message(message: "You are an amazing writer!👏🏼👏🏼👏🏼", messageTime: "Friday", isReaded: true),
                                    status: Status(isStatusAvailable: false))
        
        let vengatesh = UserData(name: "Vengatesh",
                                    profilePicture: "imageFour",
                                    phoneNumber: "+91 75977 61610",
                                    about: About(about: "Available", lastUpdateAt: "31 Aug 2023"),
                                    message: Message(message: "Yes bro, Tomorrow we are going to chennai ☺️", messageTime: "24/07/24", isReaded: true),
                                    status: Status(isStatusAvailable: false))
        
        let shalini = UserData(name: "Shalini",
                                    profilePicture: "imageFive",
                                    phoneNumber: "+91 90729 56448",
                                    about: About(about: "👽", lastUpdateAt: "13 Nov 2023"),
                                    message: Message(message: "What a powerful argument!🔥🔥🔥", messageTime: "23/07/24", isReaded: true),
                                    status: Status(isStatusAvailable: true, statusCount: 6, isStatusViewed: false))
        
        let vignesh = UserData(name: "Vignesh 😈",
                                    profilePicture: "imageSix",
                                    phoneNumber: "+91 96082 44986",
                                    about: About(about: "Money is too the final determinant...💸", lastUpdateAt: "13 Jan 2024"),
                                    message: Message(message: "Go and chat with your girl bro, don't disturb others 😅", messageTime: "22/07/24", isReaded: true),
                                    status: Status(isStatusAvailable: false))
        
        self.users = [balasuriya, aarthi, ramachandran, vengatesh, shalini, vignesh]
    }
    
    func getMoreUserInfo(_ user: UserData) {
        self.moreUserInfo = user
    }
}
