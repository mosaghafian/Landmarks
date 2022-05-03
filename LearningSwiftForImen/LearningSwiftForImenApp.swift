//
//  LearningSwiftForImenApp.swift
//  LearningSwiftForImen
//
//  Created by Mohammad Saghafian on 2022-05-02.
//

import SwiftUI

@main
struct LearningSwiftForImenApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
