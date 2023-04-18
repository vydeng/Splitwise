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
        NavigationStack {
            List {
                Picker("With you and: ", selection: $vm.chargeeID) {
                    ForEach(vm.friends) { friend in
                        Text("\(friend.name)").tag(friend)
                    }
                }
                Section {
                    TextField("Enter a description", text: $vm.description)
                    TextField("0.00", value: $vm.amount, format: .number)
                }
            }
            .navigationTitle("Add an expense")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CreateChargeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChargeView(vm: FriendsViewModel())
    }
}
