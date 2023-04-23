//
//  CreateChargeView.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import SwiftUI

struct CreateChargeView: View {
    @ObservedObject var vm: FriendsViewModel
    @Binding var tabSelection: Int
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("With you and: ")
                    .padding(.leading, 30)
                Picker("With you and: ", selection: $vm.chargee) {
                    Text("").tag("")
                    ForEach(vm.friends) { friend in
                        Text("\(friend.name)").tag(friend)
                    }
                }
                Spacer()
            }
            Spacer()
            HStack {
                Button {
                    print("button pressed")} label: { Image(systemName: "list.clipboard")
                            .font(.system(size: 40))
                    }
                    .padding(.leading, 30)
                    TextField("Enter a description", text: $vm.description)
                    .underline()
                    .keyboardType(.default)
            }
            .font(.largeTitle)
            HStack {
                Button {
                    print("button pressed")} label: { Image(systemName: "dollarsign.square")
                            .font(.system(size: 40))
                    }
                    .padding(.leading, 30)
                TextField("0.00", value: $vm.amount, format: .number)
                    .underline()
                    .keyboardType(.decimalPad)
            }
            .font(.largeTitle)
            .navigationTitle("Add an expense")
                .navigationBarTitleDisplayMode(.inline)
            Picker("", selection: $vm.owe) {
                Text("Paid by you and split equally").tag(false)
                Text("Paid by \(vm.chargee.name) and split equally").tag(true)
            }
            .border(.black)
            .padding(.top, 20)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button { self.tabSelection = 1 } label: { Image(systemName: "multiply")}
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            print(vm.chargee.owe)
                            print(vm.chargee.amount)
                            let charge = Charge(friend: vm.chargee, amount: vm.amount / 2, owe: vm.owe, description: vm.description)
                            vm.charges.append(charge)
                            if charge.owe {
                                vm.chargee.amount -= charge.amount
                                vm.total -= charge.amount
                            }
                            else {
                                vm.chargee.amount += charge.amount
                                vm.total += charge.amount
                            }
                            vm.chargee.owe = vm.chargee.checkOwe()
                            print(vm.chargee.owe)
                            print(vm.chargee.amount)
                            vm.reset()
                            self.tabSelection = 4
                        }
                        .foregroundColor(Color("green"))
                        .bold()
                        .disabled(vm.description.isEmpty || vm.amount == 0)
                        }
                    }
        }
    }
}

//struct CreateChargeView_Previews: PreviewProvider {
//    @State private var tabSelection: Int = 1
//
//    static var previews: some View {
//        CreateChargeView(vm: FriendsViewModel(), tabSelection: $tabSelection)
//    }
//}
