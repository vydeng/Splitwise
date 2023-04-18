//
//  Charge.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import Foundation

struct Charge: Identifiable {
    let id = UUID()
    var friend: Friend
    var amount: Int
    var owe: Bool
    var description: String
}
