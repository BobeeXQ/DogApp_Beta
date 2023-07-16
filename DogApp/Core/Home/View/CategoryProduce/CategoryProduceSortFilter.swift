//
//  CategoryProduceFilterView.swift
//  DogApp
//
//  Created by 向前 on 7/13/23.
//

import SwiftUI

struct CategoryProduceSortFilter: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                        .frame(width: 23)
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(darkGreen)
                            .frame(width: 15.5, height: 15.5)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                        .frame(width: 70.5)
                    
                    Text("Sort and Filter")
                        .frame(width: 173, height: 17, alignment: .center)
                        .font(.system(size: 20))
                        .foregroundColor(darkGreen)
                        .fontWeight(.semibold)
                    
                    Spacer()
                        .frame(width: 50)
                    
                    Button {
                        print("reset")
                    } label: {
                        Text("Reset")
                            .foregroundColor(midGreen)
                            .font(.system(size: 15))
                    }
                    
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                VStack{
                    Spacer()
                        .frame(height: 17)
                    
                    CategoryProduceSort()
                    
                    Spacer()
                        .frame(height: 29)

                    HStack{
                        Spacer()
                            .frame(width: 22)

                        Text("Filter By")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(darkGreen)

                        Spacer()
                    }
                    
                    CategoryProduceFilter()
                    
                    Spacer()
                        .frame(height: 450)
                }
                .background(navigationGray)
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
}


struct CategoryProductSortFilter_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduceSortFilter()
    }
}

struct CategoryProduceSort: View {
    var body: some View {
        NavigationLink {
            CategoryProduceSortView()
                .navigationBarBackButtonHidden()
        } label: {
            HStack{
                Spacer()
                    .frame(width: 35)
                
                VStack(alignment: .leading){
                    Text("Sort By")
                        .foregroundColor(darkGreen)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    
                    Spacer()
                        .frame(height: 6)
                    
                    Text("Default")
                        .foregroundColor(midGreen)
                        .font(.system(size: 15))
                }

                Spacer()
                    .frame(width: 230)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(navigationChevronGray)
                
                Spacer()
            }
            .frame(width: 370, height: 104)
            .background(.white)
            .cornerRadius(9)
        }
    }
}

struct CategoryProduceFilter: View {
    var body: some View {
        NavigationLink {
            CategoryProduceFilterView()
                .navigationBarBackButtonHidden()
            } label: {
                HStack{
                    Spacer()
                        .frame(width: 20)
                    
                    VStack(alignment: .leading){
                        Text("Protein")
                            .foregroundColor(darkGreen)
                            .font(.system(size: 15))
                    }

                    Spacer()
                        .frame(width: 260)
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(navigationChevronGray)
                    
                    Spacer()
                }
                .frame(width: 370, height: 55)
                .background(.white)
                .cornerRadius(9)
            }
    }
}
