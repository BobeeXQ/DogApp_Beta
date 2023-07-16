//
//  SearchResultView.swift
//  DogApp
//
//  Created by 向前 on 7/15/23.
//

import SwiftUI

struct ResultRowView: View {
    var foodName: String
    
    var body: some View {
        VStack{
            HStack {
                Text(foodName)
                    .font(.title2.weight(.semibold))
                Spacer()
            }
            Divider()
        }
    }
}

struct ResultDetailView: View{
    @State var product: ProductInfo
    
    var body: some View {
        ScrollView{
            VStack{
                Text("name is \(product.name)")
            }
        }
    }
}

struct ResultDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailView(product: ProductInfo(name: "apple", type: 0, ingredients: ["apple"]))
    }
}
