//
//  CustomTabBarView.swift
//  DogApp
//
//  Created by 向前 on 7/11/23.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab : Int
    
    var body: some View {
        HStack{
            Button {
                selectedTab = 0
            } label: {
                GeometryReader { geo in
                    VStack{
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        
                        Spacer()
                            .frame(height: 5)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(midGreen)
            
            
            Button {
                selectedTab = 1
            } label: {
                GeometryReader { geo in
                    VStack{
                        Image(systemName: selectedTab == 1 ? "scroll.fill" : "scroll")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        
                        Spacer()
                            .frame(height: 5)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(midGreen)
            
            
            Button {
                selectedTab = 2
            } label: {
                GeometryReader { geo in
                    VStack{
                        Image(systemName: selectedTab == 2 ? "list.clipboard.fill" : "list.clipboard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        
                        Spacer()
                            .frame(height: 5)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(midGreen)
            
            Button {
                selectedTab = 3
            } label: {
                GeometryReader { geo in
                    VStack{
                        Image(systemName: selectedTab == 3 ? "person.fill" : "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        
                        Spacer()
                            .frame(height: 5)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(midGreen)
        }
        .frame(height: 50)
        .background(tabbarGreen)
        .ignoresSafeArea(.all)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(0))
    }
}
