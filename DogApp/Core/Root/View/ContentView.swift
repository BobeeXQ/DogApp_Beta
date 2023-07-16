//
//  ContentView.swift
//  DogApp
//
//  Created by 向前 on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    @StateObject var questionnaireViewModel = QuestionnaireViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewModel.currentUser {
                if currentUser.pushQuestionnaire == false {
                    QuestionnaireView(user: currentUser)
                        .environmentObject(questionnaireViewModel)
                        .onAppear {
                            questionnaireViewModel.contentViewModel = viewModel
                        }
                }
                else {
                    MainTabView(user: currentUser)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
