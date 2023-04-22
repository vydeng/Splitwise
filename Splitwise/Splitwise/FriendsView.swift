//
//  FriendsView.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/21/23.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var vm: FriendsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("lightGray")
                    .frame(height: 100)
                    .cornerRadius(25)
                    .padding(.horizontal)
                HStack {
                    Image("orange-triangle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                    Spacer()
                    VStack {
                        Text("Total Balance")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .bold()
                        Text(vm.getStatus())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 5)
                    Spacer()
                    Image(systemName:"line.3.horizontal.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.bottom, 30)
                }
                .padding(.horizontal, 50)
            }
            List{
                ForEach(vm.friends) { friend in
                    NavigationLink (destination: Text(friend.name), label: { HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                        Text(friend.name)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        Spacer()
                        Text(friend.getStatus())
                            .font(.system(size: 15))
                    }
                    })
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "magnifyingglass")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Friends") {
                        print("Pressed")
                    }
                    .foregroundColor(Color("green"))
                }
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(vm: FriendsViewModel())
    }
}
