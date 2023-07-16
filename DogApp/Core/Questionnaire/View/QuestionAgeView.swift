//
//  QuestionAgeView.swift
//  DogApp
//
//  Created by 向前 on 7/8/23.
//

import SwiftUI

struct QuestionAgeView: View {
    @EnvironmentObject var viewModel : QuestionnaireViewModel
    
    var body: some View {
        VStack{
            TopPartAge()
     
            TextField("Age", text: $viewModel.age)
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

struct QuestionAgeView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAgeView()
    }
}

struct QuestionContextAge : View {
    var body: some View {
        Text("How old is your dog?")
            .foregroundColor(darkGreen)
            .frame(height: 30)
            .font(.system(size:28))
            .fontWeight(.bold)
    }
}

struct TopPartAge : View {
    var body: some View {
        Spacer()
            .frame(height: 179)
        
        QuestionContextAge()
        
        Spacer()
            .frame(height: 18)
        
        MessageAge()
    }
}

struct MessageAge : View {
    var body: some View {
        Text("Get customized analysis based on the dog's status")
            .frame(width: 200)
            .font(.system(size:16))
            .multilineTextAlignment(.center)
            .fontWeight(.medium)
            .foregroundColor(midGreen)
        
        Spacer()
            .frame(height: 43)
    }
}
