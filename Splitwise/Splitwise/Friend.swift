//
//  Friend.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import Foundation

struct Friend: Identifiable {
    let id = UUID()
    var name: String
    var amount: Int
    var owe: Bool
    
    func getStatus() -> String {
        var status: String = ""
        if amount == 0 {
            status = "settled up"
        }
        else if owe {
            status = "You owe \(amount)"
        }
        else {
            status = "They owe \(amount)"
        }
        return status
    }
}

