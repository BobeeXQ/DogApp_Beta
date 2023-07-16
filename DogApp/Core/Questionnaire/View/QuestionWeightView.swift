//
//  QuestionWeightView.swift
//  DogApp
//
//  Created by 向前 on 7/9/23.
//

import SwiftUI

struct QuestionWeightView: View {
    @EnvironmentObject var viewModel : QuestionnaireViewModel

    var body: some View {
        VStack{
            TopPartWeight()
            
            TextField("Weight", text: $viewModel.weight)
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

struct QuestionWeightView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionWeightView()
    }
}

struct QuestionContextWeight : View {
    var body: some View {
        Text("How much does your dog weigh?")
            .foregroundColor(darkGreen)
            .frame(width: 300)
            .font(.system(size:28))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

struct TopPartWeight : View {
    var body: some View {
        Spacer()
            .frame(height: 179)
        
        QuestionContextWeight()
        
        Spacer()
            .frame(height: 18)
        
        MessageWeight()
    }
}

struct MessageWeight : View {
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
