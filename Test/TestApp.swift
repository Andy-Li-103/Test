//
//  TestApp.swift
//  Test
//
//  Created by Andy Li on 1/8/24.
//

import SwiftUI

@main
struct TestApp: App {
    
    var body: some Scene {
        @State var model = RecipeViewModel()
        WindowGroup {
            RecipeListView()
                .environment(model)
        }
    }
}
