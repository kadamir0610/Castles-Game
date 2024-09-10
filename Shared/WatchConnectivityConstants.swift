//
//  WatchConnectivityConstants.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation

struct WatchConnectivityConstants {
    enum PlayerAction: String {
        case attack
        case fortify
    }
    static let context = "com.Castles.watchContext"
    static let castleID = "com.Castles.castleID"
    static let action = "com.Castles.action"
}
