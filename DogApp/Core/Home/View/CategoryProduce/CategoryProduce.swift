//
//  CategoryProduce.swift
//  DogApp
//
//  Created by 向前 on 7/13/23.
//

import SwiftUI

struct CategoryProduce: View {
    @Environment(\.dismiss) var dismiss
    @State var hoverUp : Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                if !hoverUp{
                    HStack{
                        Spacer()
                            .frame(width: 25)

                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(darkGreen)
                                .imageScale(.large)
                        }

                        Spacer()
                    }

                    Spacer()
                        .frame(height: 15)

                    HStack{
                        Spacer()
                            .frame(width: 25)

                        Text("Produce")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(darkGreen)

                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 15)
                }
                
                Spacer()
                    .frame(height: 5)
                
                CategoryProduceSearch(hoverUp: $hoverUp)
                
                if hoverUp {
                    CategoryProduceHoverUp()
                }
                
                Spacer()
                    .frame(height: 16)
                
                if !hoverUp{
                    HStack{
                        NavigationLink {
                            CategoryProduceMeat()
                                .navigationBarBackButtonHidden()
                        } label: {
                            VStack(alignment: .center){
                                Image(systemName: "carrot.fill")
                                    .frame(width: 83, height: 78)
                                    .foregroundColor(darkGreen)
                                    .background(tabbarGreen)
                                    .cornerRadius(9)
                                
                                Text("Meat")
                                    .font(.system(size: 13))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        
                        VStack(alignment: .center){
                            Button {
                                print("Diary")
                            } label: {
                                Image(systemName: "fish.fill")
                                    .frame(width: 83, height: 78)
                                    .foregroundColor(darkGreen)
                                    .background(tabbarGreen)
                                    .cornerRadius(9)
                            }
                            Text("Diary")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                        }
                        
                        VStack(alignment: .center){
                            Button {
                                print("Fruit")
                            } label: {
                                Image(systemName: "basket.fill")
                                    .frame(width: 83, height: 78)
                                    .foregroundColor(darkGreen)
                                    .background(tabbarGreen)
                                    .cornerRadius(9)
                            }
                            Text("Fruit")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                        }
                        
                        VStack(alignment: .center){
                            Button {
                                print("More")
                            } label: {
                                Image(systemName: "ellipsis")
                                    .frame(width: 83, height: 78)
                                    .foregroundColor(darkGreen)
                                    .background(tabbarGreen)
                                    .cornerRadius(9)
                            }
                            Text("More")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct CategoryProduce_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduce()
    }
}



struct CategoryProduceHoverUp: View {
    var body: some View {
        VStack{
            Text("a")
        }
    }
}

