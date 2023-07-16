//
//  ProductDataUpload.swift
//  DogApp
//
//  Created by 向前 on 7/15/23.
//

import Foundation
import Firebase

func generateTestData() -> [ProductInfo] {
    let products: [ProductInfo] = [
        ProductInfo(name: "Apple", type: 0, ingredients: ["apple"]),
        ProductInfo(name: "Beef", type: 0, ingredients: ["beef"]),
        ProductInfo(name: "Bully Stick", type: 1, ingredients: ["beef"]),
        ProductInfo(name: "Chips", type: 2, ingredients: ["potato"]),
        ProductInfo(name: "Chocolate", type: 2, ingredients: ["cocoa"]),
        ProductInfo(name: "Tundra", type: 1, ingredients: ["lamb","vension","duck","egg"]),
        ProductInfo(name: "Drumstick", type: 0, ingredients: ["Chicken"])
    ]
    return products
}

func uploadTestData() {
    let products = generateTestData()

    let db = Firestore.firestore()

    // upload without checking if product has already existed
    
//    for product in products {
//        do {
//            let _ = try db.collection("products").addDocument(from: product)
//            print("Upload successful!")
//        } catch let error {
//            print("Error writing document: \(error)")
//        }
//    }
    
    // upload while checking if product exists, avoid duplication, but requires read
    
    for product in products {
            db.collection("products").whereField("name", isEqualTo: product.name).getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else if let snapshot = snapshot {
                    if snapshot.documents.isEmpty {
                        
                        // No document with the same product name exists, add the new product
                        do {
                            let _ = try db.collection("products").addDocument(from: product)
                            print("Upload successful!")
                        } catch let error {
                            print("Error writing document: \(error)")
                        }
                    } else {
                        
                        // A document with the same product name already exists
                        print("A product with the name \(product.name) already exists.")
                    }
                }
            }
        }
}
