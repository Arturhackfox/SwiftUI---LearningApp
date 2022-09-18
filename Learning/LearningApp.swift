//
//  LearningApp.swift
//  Learning
//
//  Created by Arthur Sh on 18.09.2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
