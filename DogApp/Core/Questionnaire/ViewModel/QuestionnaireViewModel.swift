//
//  QuestionnaireViewModel.swift
//  DogApp
//
//  Created by 向前 on 7/10/23.
//

import Foundation
import Firebase

class QuestionnaireViewModel : ObservableObject {
    @Published var name = ""
    @Published var age = ""
    @Published var weight = ""
    @Published var allergies : [String] = []
    @Published var illnesses : [String] = []
    @Published var skip : Bool = false
    
    weak var contentViewModel: ContentViewModel?
    
    func clearCache() {
        name = ""
        age = ""
        weight = ""
        allergies = []
        illnesses = []
        skip = false
    }
    
    func skipUpload(user: User) async throws {
        
        let updatedUser = User(id: user.id, username: user.username, profileImageUrl: user.profileImageUrl, email: user.email, pushQuestionnaire: true, dogs: [])
        
        clearCache()
        
        do {
            let updatedUserData = try Firestore.Encoder().encode(updatedUser)
            
            try await Firestore.firestore().collection("users").document(user.id).setData(updatedUserData)
            
            Task {
                self.contentViewModel?.currentUser = updatedUser
            }
            
        } catch {
            print("Error skipping upload: \(error)")
        }
    }

    func uploadDogInfo(user: User) async throws {
        
        let dog = Dog(name: name, age: age, weight: weight, allergies: allergies, illnesses: illnesses)
        
        clearCache()
        //        guard let encodedDog = try? Firestore.Encoder().encode(dog) else { return }
        //        try? await Firestore.firestore().collection("dogs").document(dog.id).setData(encodedDog)
        
        //        var updatedUser = user
        //        updatedUser.dogs.append(dog)
        //        updatedUser.pushQuestionnaire = true
        
        let updatedUser = User(id: user.id, username: user.username, profileImageUrl: user.profileImageUrl, email: user.email, pushQuestionnaire: true, dogs: [dog])
        
        //        try? await Firestore.firestore().collection("users").document(user.id).updateData(["dogIDs": FieldValue.arrayUnion([dog.id])])
        
        do {
            let updatedUserData = try Firestore.Encoder().encode(updatedUser)
            try await Firestore.firestore().collection("users").document(user.id).setData(updatedUserData)
            //            try await Firestore.firestore().collection("users").document(user.id).updateData(["pushQuestionnaire": true])
            
            Task {
                self.contentViewModel?.currentUser = updatedUser
            }
            
        } catch {
            print("Error updating document: \(error)")
        }
        
        //        DispatchQueue.main.async {
        ////            self.contentViewModel?.currentUser?.pushQuestionnaire = true
        //
        //            self.contentViewModel?.currentUser = updatedUser
        //        }
        
    }
}
