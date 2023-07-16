//
//  CategoryProduceSearch.swift
//  DogApp
//
//  Created by 向前 on 7/13/23.
//

import SwiftUI

struct CategoryProduceSearch: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var hoverUp : Bool
    @State private var isPresented = false
    
    var body: some View{
        HStack{
            TextField("Search produce", text: $searchText)
                .autocorrectionDisabled()
                .padding(13)
                .padding(.horizontal, 35)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .overlay(
                    HStack {
                        if !isEditing {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                        else{
                            Button(action: {
                                withAnimation{
                                    self.isEditing = false
                                    self.searchText = ""
                                    hoverUp = false
                                    UIApplication.shared.endEditing()
                                }
                            }) {
                                Image(systemName: "arrow.left")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 16)
                                    .padding(.top)
                                    .padding(.bottom)
                            }
                            
                            Spacer()
                        }
                        if isEditing {
                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                }
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                    .opacity(self.searchText.isEmpty ? 0 : 1)
                            }
                        }
                        else {
                            Button {
                                isPresented = true
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 20)
                            }
                            .sheet(isPresented: $isPresented){
                                CategoryProduceSortFilter()
                            }
                            
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                        hoverUp = true
                    }
                }
            //                .onChange(of: text, perform: { newValue in
            //                    model.getData(from: newValue)
            //                })
        }
        .frame(width: 363, height: 49)
    }
}

struct CategoryProduceSearch_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduceSearch(hoverUp: .constant(false))
    }
}
