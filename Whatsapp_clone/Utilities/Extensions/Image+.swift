//
//  Image+.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 02/08/24.
//

import SwiftUI

var archiveboxIcon: Image {
    Image(size: CGSize(width: 60, height: 35)) { ctx in
        ctx.draw(Image(systemName: "archivebox.fill"),
                 at: CGPoint(x: 30, y: 10), anchor: .center)
        
        ctx.draw(Text("Archive").font(.footnote),
                 at: CGPoint(x: 30, y: 30), anchor: .center)
    }
}

var moreIcon: Image {
    Image(size: CGSize(width: 60, height: 35)) { ctx in
        ctx.draw(Image(systemName: "ellipsis"),
                 at: CGPoint(x: 30, y: 10), anchor: .center)
        
        ctx.draw(Text("More").font(.footnote),
                 at: CGPoint(x: 30, y: 30), anchor: .center)
    }
}
