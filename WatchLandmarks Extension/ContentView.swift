//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by jae hwan choo on 2021/08/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
