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
    @Published var chargee: Friend = Friend(name:"Vivian", amount:0.00, owe:false)
    @Published var description: String = ""
    @Published var owe: Bool = false
    @Published var amount: Float = 0.00
    @Published var charges: [Charge] = []
    
    init() {}
}
