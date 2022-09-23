//
//  ContentView.swift
//  Learning
//
//  Created by Arthur Sh on 18.09.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    var body: some View {
        
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                Text("What do you want to do today ?")
                    .padding(.leading, 20)
                
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(model.modules){ module in
                            
                            
                            NavigationLink(
                                destination:
                                    ContentViewLessonList()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                    }),
                                tag: module.id,
                                selection: $model.currentSelectedContent
                                
                            ){
                                
                                // Learning card
                                HomeViewRowCards(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time)
                            }
                            .accentColor(.black)
                            
                            
                            NavigationLink(
                                destination: TestView()
                                    .onAppear(perform: {
                                    model.beginTest(module.id)
                                })
                                   ,
                                tag: module.id,
                                selection: $model.currentTestSelected) {
                                    
                                    // Test card
                                    HomeViewRowCards(image: module.test.image, title: "\(module.category)", description: module.test.description, count: "\(module.test.questions.count) Questions ", time: module.test.time)
                                }
                                .accentColor(.black)
                            
                            
                            
                        }
                        
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
