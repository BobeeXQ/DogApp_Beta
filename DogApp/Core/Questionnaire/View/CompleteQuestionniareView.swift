//
//  CompleteQuestionniareView.swift
//  DogApp
//
//  Created by 向前 on 7/10/23.
//

import SwiftUI
import Firebase

struct CompleteQuestionniareView: View {
    @State var user: User
    @EnvironmentObject var viewModel : QuestionnaireViewModel
    
    var body: some View {
        ZStack{
            backgroundGreen
                .ignoresSafeArea(.all)
            
            VStack{
                Spacer()
                    .frame(height: 700)
                
                Button{
                    Task {
                        if viewModel.skip{
                            try await viewModel.skipUpload(user: user)
                        }
                        else {
                            try await viewModel.uploadDogInfo(user: user)
                        }
                    }
                }label: {
                    Text("Get Started")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(width: 240, height: 53)
                }
                .buttonStyle(QuestionnaireButton())
                
            }
        }
    }
}

struct CompleteQuestionniareView_Previews: PreviewProvider {
    static var previews: some View {
        let tempUser = User(id: "a", username: "Mock User", email: "test@gmail.com")
        CompleteQuestionniareView(user: tempUser)
    }
}
