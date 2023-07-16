//
//  QuestionIllnessView.swift
//  DogApp
//
//  Created by 向前 on 7/11/23.
//

import SwiftUI

struct QuestionIllnessView: View {
    @EnvironmentObject var viewModel : QuestionnaireViewModel
    
    @State private var illnesses = ["Cough", "Dental Disease", "Ear Infection", "Heartworm", "Itchy Skin", "Obesity"]
    @State private var enteredIllness = ""
    @State private var isEditing = false
    
    var filteredIllnesses: [String] {
        if enteredIllness.isEmpty {
            return []
        } else {
            return illnesses.filter { $0.lowercased().contains(enteredIllness.lowercased()) }
        }
    }

    
    var body: some View {
        VStack{
            TopPartIllness()
            
            TextField("Illness", text: $enteredIllness)
                .frame(width: 346, height: 30)
                .font(.system(size:20))
                .fontWeight(.bold)
                .autocorrectionDisabled(true)
                .overlay(
                    HStack {
                        Spacer()
                        if isEditing {
                            Button(action: {
                                withAnimation{
                                    self.enteredIllness = ""
                                }
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                    .opacity(enteredIllness.isEmpty ? 0 : 1)
                            }
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                    }
                }
            
            Divider()
                .frame(width: 346, height: 1)
            
            ForEach(filteredIllnesses, id: \.self) { illness in
                Button(action: {
                    if !viewModel.illnesses.contains(illness) {
                        viewModel.illnesses.append(illness)
                        enteredIllness = ""
                    }
                }) {
                    Text(illness)
                        .frame(width: 150, height: 30)
                        .background(lightGreen)
                        .foregroundColor(darkGreen)
                        .cornerRadius(25)
                }
            }
            .buttonStyle(PlainButtonStyle())

            ForEach(viewModel.illnesses, id: \.self) { illness in
                Text("\(illness)")
                    .frame(width: 137, height: 35)
                    .font(.system(size: 15))
                    .background(lightGreen)
                    .foregroundColor(darkGreen)
                    .cornerRadius(25)
                    .overlay{
                        HStack{
                            Spacer()
                                .frame(width: 15)
                            
                            Button(action: {
                                withAnimation{
                                    if let index = viewModel.illnesses.firstIndex(of: illness) {
                                        viewModel.illnesses.remove(at: index)
                                    }
                                }
                            }) {
                                Image(systemName: "multiply")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                            
                            Spacer()
                        }
                    }
                
            }
            
            Spacer()
                .frame(minHeight: 113)
        }
    }
}

struct QuestionIllnessView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionIllnessView()
    }
}

struct QuestionContextIllness : View {
    var body: some View {
        Text("What kind of illness does your dog have?")
            .foregroundColor(darkGreen)
            .frame(width: 310)
            .font(.system(size:28))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)

    }
}

struct TopPartIllness : View {
    var body: some View {
        Spacer()
            .frame(height: 179)
        
        QuestionContextIllness()
        
        Spacer()
            .frame(height: 18)
        
        MessageIllness()
    }
}

struct MessageIllness : View {
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
