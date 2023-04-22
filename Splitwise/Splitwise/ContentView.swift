//
//  ContentView.swift
//  Splitwise
//
//  Created by Vivian Deng on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = FriendsViewModel()
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FriendsView(vm: vm)
                .tabItem {
                    Label("Friends", systemImage: "person.fill")
                }
                .tag(1)
            Text("Groups")
                .tabItem {
                    Label("Groups", systemImage: "person.3")
                }
                .tag(2)
            CreateChargeView(vm: vm, tabSelection: $tabSelection)
                .tabItem {
                    Label("New", systemImage: "plus.square.fill")
                }
                .tag(3)
            ActivityView(vm: vm)
                .tabItem {
                    Label("Activity", systemImage: "chart.xyaxis.line")
                }
                .tag(4)
            Text("Account")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
