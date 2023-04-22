//
//  FriendsViewModel.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var friends: [Friend] = [Friend(name:"Vivian", amount:0.00, owe: false), Friend(name: "Alec", amount: 0.00, owe: false), Friend(name: "Sophie", amount: 0.00, owe: false)]
    @Published var isShowing: Bool = false
    @Published var chargee: Friend = Friend(name:"", amount:0.00, owe:false)
    @Published var description: String = ""
    @Published var owe: Bool = false
    @Published var amount: Float = 0.00
    @Published var charges: [Charge] = []
    @Published var total: Float = 0.00
    
    init() {}
    
    func getStatus() -> String {
        var status: String = ""
        if total == 0.00 {
            status = "You are all settled up"
        }
        else if total < 0 {
            status = "You owe \(String(format: "%.2f", abs(total)))"
        }
        else {
            status = "You are owed \(String(format: "%.2f", abs(total)))"
        }
        return status
    }
        
    func reset() {
        amount = 0.00
        chargee = friends[0]
        description = ""
        owe = false
    }
}
