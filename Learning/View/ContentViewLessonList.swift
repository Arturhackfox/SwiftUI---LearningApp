//
//  ContentViewLessonList.swift
//  Learning
//
//  Created by Arthur Sh on 18.09.2022.
//

import SwiftUI

struct ContentViewLessonList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {

        ScrollView{
            
            LazyVStack{
                
                if model.currentModule != nil {
                
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self){ index in
                            
                        ContentViewListRow(index: index)
                            
                            
                    }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "" )")
            
        }
        

    }
}

struct ContentViewLessonList_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLessonList()
            .environmentObject(ContentModel())
    }
}
