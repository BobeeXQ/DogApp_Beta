//
//  MainTabView.swift
//  DogApp
//
//  Created by 向前 on 7/10/23.
//

import SwiftUI
import Firebase

struct MainTabView: View {
    let user: User
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(user: user)
                .tag(0)
            DiscoveryView()
                .tag(1)
            DietTrackingView()
                .tag(2)
            ProfileView(user: user)
                .tag(3)
        }
        .overlay(
            CustomTabBarView(selectedTab: $selectedTab),
            alignment: .bottom
        )
        .ignoresSafeArea(.keyboard)
//        .onAppear() {
//            uploadTestData()
//        }
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        let tempUser = User(id: "a", username: "Mock User", email: "test@gmail.com")
        MainTabView(user: tempUser)
    }
}
