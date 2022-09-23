//
//  ContentDetailViewInsideList.swift
//  Learning
//
//  Created by Arthur Sh on 18.09.2022.
//

import SwiftUI
import AVKit

struct ContentDetailViewInsideList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack{
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            
            CodeTextView()
                .frame(height: 48)
            
            if model.hasNextLesson() {
                
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack{
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                    
                }
                
            } else {

                Button {
                    model.currentSelectedContent = nil
            } label: {
               
                    ZStack{
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                            
                    }
                    
                    
                }
            }

                
                
                
            }
        .navigationTitle(lesson?.title ?? "")
        .padding()
        }
      
        
        
        
        
    }


struct ContentDetailViewInsideList_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailViewInsideList()
            .environmentObject(ContentModel())
    }
}
