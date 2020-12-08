//
//  Smiley.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/13.
//

import Foundation

class Smiley {
    class var text: String {
        return ":)"
    }
}

class EmojiSmiley: Smiley {
    override class var text: String {
        return "😊"
    }
}
