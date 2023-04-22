//
//  ActivityView.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/22/23.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var vm: FriendsViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.charges) {charge in
                    HStack {
                        Image(systemName: "list.clipboard")
                            .font(.largeTitle)
                        VStack {
                            Text("You added \(charge.description)")
                            if charge.owe {
                                Text("You owe $\((String(format: "%.2f", charge.amount)))")
                                    .foregroundColor(.orange)
                            }
                            else {
                                Text("You get back $\(String(format: "%.2f", charge.amount))")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(10)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Recent Activity")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(vm: FriendsViewModel())
    }
}
