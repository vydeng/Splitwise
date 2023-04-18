//
//  FriendsViewModel.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var friends: [Friend] = [Friend(name:"Vivian", amount:0, owe:false), Friend(name: "Alec", amount: 20, owe: true), Friend(name: "Sophie", amount: 10, owe: false)]
    
    init() {}
}
