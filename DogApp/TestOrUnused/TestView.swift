//
//  TestView.swift
//  DogApp
//
//  Created by 向前 on 7/11/23.
//

import SwiftUI

struct TestView: View {
    @State var name: String
    
    var body: some View {
        VStack{
            TopPartTest()
            
            TextField("Dog Name", text: $name)
                .frame(width: 346, height: 30)
                .font(.system(size:20))
                .fontWeight(.bold)
                .autocorrectionDisabled(true)
            
            Divider()
                .frame(width: 346, height: 1)
            
            Spacer()
                .frame(minHeight: 113)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(name: "a")
    }
}

struct QuestionContextTest : View {
    var body: some View {
        Text("What's your dog's name?")
            .foregroundColor(darkGreen)
            .frame(height: 30)
            .font(.system(size:28))
            .fontWeight(.bold)
    }
}

struct TopPartTest : View {
    var body: some View {
        Spacer()
            .frame(height: 191)
        
        QuestionContextTest()
        
        Spacer()
            .frame(height: 58)
    }
}

