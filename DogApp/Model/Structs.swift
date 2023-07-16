//
//  Structs.swift
//  DogApp
//
//  Created by 向前 on 7/10/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    let email: String
    var pushQuestionnaire: Bool?
    var dogs: [Dog]?
}

struct Dog: Identifiable, Codable {
    var id: String
    var name: String?
    var age: String?
    var weight: String?
    var allergies: [String]?
    var illnesses: [String]?
    
    init(name: String? = nil, age: String? = nil, weight: String? = nil, allergies: [String]? = nil, illnesses: [String]? = nil) {
        self.id = UUID().uuidString
        self.name = name
        self.age = age
        self.weight = weight
        self.allergies = allergies
        self.illnesses = illnesses
    }
}

struct ProductInfo: Identifiable, Codable {
    let id: String
    let name: String
    let type: Int  // 0 for produce, 1 for dog food, 2 for manufacture
    let searchWords: [String]
    let ingredients: [String]
    
    init(name: String, type: Int, ingredients: [String]){
        self.id = UUID().uuidString
        self.name = name
        self.type = type
        self.searchWords = name.generateStringSequence()
        self.ingredients = ingredients
    }
}
