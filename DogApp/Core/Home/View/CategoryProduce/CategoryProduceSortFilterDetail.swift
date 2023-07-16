//
//  CategoryProduceSortFilterDetail.swift
//  DogApp
//
//  Created by 向前 on 7/14/23.
//

import SwiftUI

struct CategoryProduceSortView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                    .frame(width: 23)
                
                Button {
                    print("reset")
                } label: {
                    Text("Reset")
                        .foregroundColor(midGreen)
                        .font(.system(size: 15))
                }
                
                Spacer()
                    .frame(width: 50)
                
                Text("Sort By")
                    .frame(width: 173, height: 17, alignment: .center)
                    .font(.system(size: 20))
                    .foregroundColor(darkGreen)
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(width: 45)
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .frame(width: 40, height: 17)
                        .font(.system(size: 15))
                        .foregroundColor(midGreen)
                }
                
                Spacer()
            }
            .padding(.top, 45)
            .padding(.bottom, 15)
            
            VStack{
                Text("Here is sort")
                    .frame(width: 400, height: 700)
            }
            .background(navigationGray)
            
            Spacer()
        }
    }
}

struct CategoryProduceFilterView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                    .frame(width: 23)
                
                Button {
                    print("reset")
                } label: {
                    Text("Reset")
                        .foregroundColor(midGreen)
                        .font(.system(size: 15))
                }
                
                Spacer()
                    .frame(width: 50)
                
                Text("Protein")
                    .frame(width: 173, height: 17, alignment: .center)
                    .font(.system(size: 20))
                    .foregroundColor(darkGreen)
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(width: 45)
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .frame(width: 40, height: 17)
                        .font(.system(size: 15))
                        .foregroundColor(midGreen)
                }
                
                Spacer()
            }
            .padding(.top, 45)
            .padding(.bottom, 15)
            
            VStack{
                Text("Here is filter by protein")
                    .frame(width: 400, height: 700)
            }
            .background(navigationGray)
            
            Spacer()
        }
    }
}


struct CategoryProduceSortView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduceSortView()
    }
}

struct CategoryProduceFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduceFilterView()
    }
}
