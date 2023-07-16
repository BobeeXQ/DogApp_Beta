//
//  QuestionnaireView.swift
//  DogApp
//
//  Created by 向前 on 7/8/23.
//

import SwiftUI

struct QuestionnaireView: View {
    @EnvironmentObject var viewModel : QuestionnaireViewModel
    
    @State var user: User
    @State private var selectedTab = 0
    @State private var done = false
    
    var buttonText : String {
        if selectedTab < 4 {
            return "Continue"
        }
        else {
            return "Done"
        }
    }
    
    var body: some View {
        if done == false {
            ZStack{
                backgroundGreen
                    .ignoresSafeArea(.all)
                
                TabView(selection: $selectedTab) {
                    QuestionNameView()
                        .tag(0)
                    
                    QuestionAgeView()
                        .tag(1)
                    
                    QuestionWeightView()
                        .tag(2)
                    
                    QuestionAllergyView()
                        .tag(3)
                    
                    QuestionIllnessView()
                        .tag(4)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .ignoresSafeArea(.all)
                .animation(.easeInOut)  // TODO
                .transition(.slide)
                
                VStack{
                    Spacer()
                        .frame(height: 35)
                    
                    HStack{
                        Spacer()
                            .frame(width: 316)
                        
                        Button(action: {
                            viewModel.skip = true
                            done = true
                        }, label: {
                            Text("Skip")
                                .font(.system(size:16))
                                .foregroundColor(darkGreen)
                                .frame(width: 38, height: 30)
                        })
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 600)
                    
                    Button {
                        if selectedTab < 4 {
                            selectedTab += 1
                        }
                        else {
                            done = true
                        }
                    } label: {
                        Text(buttonText)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(width: 240, height: 49)
                        
                    }
                    .buttonStyle(QuestionnaireButton())
                    
                    Spacer()
                }
            }
        }
        else {
            CompleteQuestionniareView(user: user)
        }
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        let tempUser = User(id: "a", username: "Mock User", email: "test@gmail.com")
        QuestionnaireView(user: tempUser)
    }
}
