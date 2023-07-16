//
//  QuestionAllergyView.swift
//  DogApp
//
//  Created by 向前 on 7/9/23.
//

import SwiftUI

struct QuestionAllergyView: View {
    @EnvironmentObject var viewModel : QuestionnaireViewModel
    
    @State private var allergies = ["Egg", "Chicken", "Beef", "Turkey", "Tomato"]
    @State private var enteredAllergy = ""
    @State private var isEditing = false
    
    var filteredAllergies: [String] {
        if enteredAllergy.isEmpty {
            return []
        } else {
            return allergies.filter { $0.lowercased().contains(enteredAllergy.lowercased()) }
        }
    }
    
    var body: some View {
        VStack{
            TopPartAllergy()

            TextField("Food", text: $enteredAllergy)
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
                                    self.enteredAllergy = ""
                                }
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                    .opacity(enteredAllergy.isEmpty ? 0 : 1)
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
            
            ForEach(filteredAllergies, id: \.self) { allergy in
                Button(action: {
                    if !viewModel.allergies.contains(allergy) {
                        viewModel.allergies.append(allergy)
                        enteredAllergy = ""
                    }
                }) {
                    Text(allergy)
                        .frame(width: 150, height: 30)
                        .background(lightGreen)
                        .foregroundColor(darkGreen)
                        .cornerRadius(25)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            ForEach(viewModel.allergies, id: \.self) { allergy in
                Text("\(allergy)")
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
                                    if let index = viewModel.allergies.firstIndex(of: allergy) {
                                        viewModel.allergies.remove(at: index)
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

struct QuestionAllergyView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAllergyView()
    }
}

struct QuestionContextAllergy : View {
    var body: some View {
        Text("What kind of food is your dog allergic to?")
            .foregroundColor(darkGreen)
            .frame(width: 350)
            .font(.system(size:28))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

struct TopPartAllergy : View {
    var body: some View {
        Spacer()
            .frame(height: 179)
        
        QuestionContextAllergy()
        
        Spacer()
            .frame(height: 18)
        
        MessageAllergy()
    }
}

struct MessageAllergy : View {
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
