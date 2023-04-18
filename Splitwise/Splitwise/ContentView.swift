//
//  ContentView.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = FriendsViewModel()
    
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
                        Text("You are all settled up")
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
                    .foregroundColor(.green)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Friends")
                                .font(.system(size: 13))
                        }
                        Spacer()
                        Button {
                            print("Groups")
                        } label: {
                            VStack {
                                Image(systemName: "person.3")
                                    .foregroundColor(.gray)
                                Text("Groups")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13))
                            }
                        }
                        Spacer()
                        Button {
                            print("Plus")
                        } label: {
                            ZStack {
                                Color("green")
                                    .frame(width: 40, height: 40)
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        Button {
                            print("Activity")
                        } label: {
                            VStack {
                                Image(systemName: "chart.xyaxis.line")
                                    .foregroundColor(.gray)
                                Text("Activity")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13))
                            }
                        }
                        Spacer()
                        Button {
                            print("Account")
                        } label: {
                            VStack {
                                Image("orange-triangle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(10)
                                Text("Account")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
