//
//  HomeViewSearchHoverUp.swift
//  DogApp
//
//  Created by 向前 on 7/13/23.
//

import SwiftUI

struct HomeViewSearchHoverUp : View {
    @State var category : Int = 0
    @Binding var searchText : String
    @EnvironmentObject var fetchModel: FetchDataModel
    
    var body: some View{
        VStack{
            HomeViewSearchHoverUpCategory(category: $category)
            
            Spacer()
                .frame(height: 28)
            
            if searchText == ""{
                HomeViewSearchHoverUpRecentSearch()
                
                Spacer()
                    .frame(height: 34)
                
                HomeViewSearchHoverUpSuggested()
            } else {
                ScrollView{
                    VStack{
                        ForEach(fetchModel.results, id: \.id){product in
                            NavigationLink(destination: ResultDetailView(product: product)) {
                                ResultRowView(foodName: product.name)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .animation(.easeInOut, value: searchText)
        .ignoresSafeArea(.keyboard)
        
    }
}

struct HomeViewSearchHoverUp_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSearchHoverUp(searchText: .constant(""))
    }
}

struct HomeViewSearchHoverUpCategory : View {
    @EnvironmentObject var fetchModel:  FetchDataModel
    @Binding var category : Int
    
    var body: some View {
        ScrollView(.horizontal){
            ScrollViewReader{ scrollProxy in
                HStack(spacing: 0){
                    Button {
                        category = 0
                        fetchModel.category = 0
                        scrollProxy.scrollTo(category, anchor: .leading)
                        //                        fetchModel.getData(from: ) //TODO
                    } label: {
                        VStack{
                            Text("All")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 90, height: 30)
                            Rectangle()
                                .frame(width: 90, height: 5)
                                .foregroundColor(category == 0 ? midGreen : lightGray)
                        }
                    }
                    .id(0)
                    
                    Button {
                        category = 1
                        fetchModel.category = 1
                    } label: {
                        VStack{
                            Text("Produce")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 110, height: 30)
                            Rectangle()
                                .frame(width: 110, height: 5)
                                .foregroundColor(category == 1 ? midGreen : lightGray)
                        }
                    }
                    .id(1)
                    
                    Button {
                        category = 2
                        fetchModel.category = 2
                    } label: {
                        VStack{
                            Text("Dog Food")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 118, height: 30)
                            Rectangle()
                                .frame(width: 118, height: 5)
                                .foregroundColor(category == 2 ? midGreen : lightGray)
                        }
                    }
                    .id(2)
                    
                    Button {
                        category = 3
                        fetchModel.category = 3
                        scrollProxy.scrollTo(category, anchor: .trailing)
                    } label: {
                        VStack{
                            Text("Manufacture")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 110, height: 30)
                            Rectangle()
                                .frame(width: 110, height: 5)
                                .foregroundColor(category == 3 ? midGreen : lightGray)
                        }
                    }
                    .id(3)
                }
            }
        }
        .scrollIndicators(.hidden)
        //        .animation(.easeInOut)
        .ignoresSafeArea(.keyboard)
    }
}

struct HomeViewSearchHoverUpRecentSearch : View {
    var body: some View {
        VStack{
            HStack {
                Spacer()
                    .frame(width: 14)
                
                Text("Recent Search")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 114, height: 21)
                
                Spacer()
                    .frame(width: 200)
                
                Button {
                    print("search history deleted")
                } label: {
                    Text("Delete")
                        .font(.system(size: 15))
                        .foregroundColor(midGreen)
                        .fontWeight(.medium)
                }
                Spacer()
            }
            
            Spacer()
                .frame(height: 11)
            
            HStack {
                Spacer()
                    .frame(width: 14)
                
                Button {
                    print("lettuce pressed")
                } label: {
                    Text("Lettuce")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 78, height: 29)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(borderGray)
                        )
                }
                
                Spacer()
                    .frame(width: 14)
                
                Button {
                    print("Broccoli sprout pressed")
                } label: {
                    Text("Broccoli Sprout")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 138, height: 29)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(borderGray)
                        )
                }
                
                Spacer()
                    .frame(width: 14)
                
                Button {
                    print("Expand")
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(width: 42, height: 29)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(borderGray)
                        )
                    
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct HomeViewSearchHoverUpSuggested : View {
    let suggestedResults : [String] = ["Protein", "Fat", "Carb", "Special Diet", "Lifestage", "Protein", "Fat", "Carb", "Special Diet", "Lifestage", "Protein", "Fat", "Carb", "Special Diet", "Lifestage"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Suggested")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 107, height: 21)
                
                Spacer()
                    .frame(width: 195)
                Button {
                    print("Shuffle results")
                } label: {
                    HStack{
                        Image(systemName: "repeat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            .foregroundColor(midGreen)
                        
                        Text("Shuffle")
                            .fontWeight(.medium)
                            .font(.system(size: 15))
                            .foregroundColor(midGreen)
                    }
                }
                
                Spacer()
            }
            
            ScrollView{
                ForEach(suggestedResults, id: \.self){ result in
                    VStack{
                        HStack{
                            Spacer()
                                .frame(width: 21)
                            
                            Text(result)
                                .foregroundColor(darkGreen)
                                .font(.system(size: 15))
                                .frame(width: 150, height: 11, alignment: .leading)
                                .padding(.top, 14)
                                .padding(.bottom, 13)
                            
                            Spacer()
                        }
                        
                        Divider()
                            .frame(width: 358, height: 0.3)
                            .overlay(.gray)
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
            .gesture(DragGesture().onChanged({_ in
                UIApplication.shared.dismissKeyboard()
            }))
        }
        .ignoresSafeArea(.keyboard)
    }
}


