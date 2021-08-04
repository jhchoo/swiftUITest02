//
//  swiftuiTest02App.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/02.
//

import SwiftUI

@main
struct swiftuiTest02App: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)	
        }
    }
}
