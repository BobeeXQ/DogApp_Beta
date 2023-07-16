//
//  ContentView.swift
//  DogApp
//
//  Created by 向前 on 7/7/23.
//

import SwiftUI

struct QuestionNameView: View {
    @EnvironmentObject var viewModel : QuestionnaireViewModel
    
    var body: some View {
        VStack{
            TopPartName()
            
            TextField("Dog Name", text: $viewModel.name)
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

struct QuestionNameView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionNameView()
    }
}

struct QuestionContextName : View {
    var body: some View {
        Text("What's your dog's name?")
            .foregroundColor(darkGreen)
            .frame(height: 30)
            .font(.system(size:28))
            .fontWeight(.bold)
    }
}

struct TopPartName : View {
    var body: some View {
        Spacer()
            .frame(height: 191)
        
        QuestionContextName()
        
        Spacer()
            .frame(height: 58)
    }
}
