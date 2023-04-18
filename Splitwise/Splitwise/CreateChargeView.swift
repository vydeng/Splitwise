//
//  CreateChargeView.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import SwiftUI

struct CreateChargeView: View {
    @ObservedObject var vm: FriendsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Create a Charge")
//        NavigationStack {
//            List {
//                Picker("With you and: ", selection: $vm.chargeeID) {
//                    ForEach(vm.friends) { friend in
//                        Text("\(friend.name)").tag(friend.id)
//                    }
//                }
//            }
//        }
    }
}

struct CreateChargeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChargeView(vm: FriendsViewModel())
    }
}
