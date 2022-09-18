//
//  HomeViewRowCards.swift
//  Learning
//
//  Created by Arthur Sh on 18.09.2022.
//

import SwiftUI

struct HomeViewRowCards: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack{
                                            
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())

                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Learn \(title )")
                        .bold()
                    
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // Icons
                    HStack{
                        
                        Image(systemName: "text.book.closed")
                             .resizable()
                            .frame(width: 15, height: 15)
                        
                        
                        Text(count)
                            .font(.system(size: 10))
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15 )
                        
                        Text(time)
                            .font(.system(size: 9))
                    }
                    
                }
                .padding(20)
                

                
            }
            .padding(.horizontal, 20)
            
            
             }
        
    }
}

struct HomeViewRowCards_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRowCards(image: "swift", title: "Learn Swift", description: "descriptiondescriptiondescriptiondescription, ", count: "12 lessons", time: "2 hours")
    }
}
