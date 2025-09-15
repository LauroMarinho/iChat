//
//  Message.swift
//  iChat
//
//  Created by Lauro Marinho on 13/04/25.
//

import Foundation

struct Message: Hashable{
    let uuid: String
    let text: String
    let isMe: Bool
    let timestamp: UInt
}
