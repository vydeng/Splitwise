//
//  Friend.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import Foundation

class Friend: Identifiable, Hashable {
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID()
    @Published var name: String
    @Published var amount: Float
    @Published var owe: Bool
    
    init(name: String, amount: Float, owe: Bool) {
        self.name = name
        self.amount = amount
        self.owe = owe
    }
    
    func checkOwe() -> Bool {
        if amount >= 0 {
            return false
        }
        else {
            return true
        }
    }
    
    func getStatus() -> String {
        var status: String = ""
        if amount == 0 {
            status = "settled up"
        }
        else if owe {
            status = "You owe \(abs(amount))"
        }
        else {
            status = "They owe \(abs(amount))"
        }
        return status
    }
}

