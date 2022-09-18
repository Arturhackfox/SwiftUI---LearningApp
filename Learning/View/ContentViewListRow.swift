//
//  ContentViewListRow.swift
//  Learning
//
//  Created by Arthur Sh on 18.09.2022.
//

import SwiftUI

struct ContentViewListRow: View {
    
    @EnvironmentObject var model: ContentModel
    
    var index: Int
    
    
    var body: some View {
        
        let lessons = model.currentModule!.content.lessons[index]
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 30){
                
                Text("\(index + 1)")
                    .padding(.leading, 20)
                    .bold()
                
                VStack(alignment: .leading){
                    
                    Text(lessons.title)
                        .bold()
                    
                    Text(lessons.duration)
                    
                }
                
            }
            .padding()
            
        }
        .padding(.bottom, 5)
        
    }
}

