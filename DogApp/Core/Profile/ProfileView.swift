//
//  ProfileView.swift
//  DogApp
//
//  Created by 向前 on 7/11/23.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
//    var dogName : String {
//        if user.dogs?.count != 0 {
//            return user.dogs![0].name!
//        }
//        else {
//            return "N/A"
//        }
//    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView {
                    Text("Username: \(user.username)")
                    Text("Email: \(user.email)")
//                    Text("Dog name: \(dogName)")
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signout()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let tempUser = User(id: "a", username: "Mock User", email: "test@gmail.com")
        MainTabView(user: tempUser)
    }
}
