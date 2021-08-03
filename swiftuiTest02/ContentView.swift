//
//  ContentView.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/02.
//

import SwiftUI

struct ContentView: View {
    
    let myNavigationTitle = "스위프트UI 테스트"
    let listName:[String] = ["01. 기본 가이드",
                             "02.",
                             "03.",
                             "04.",
                             "05."]
                            
    var body: some View {
        ZStack() {
            Color.red.ignoresSafeArea()
            NavigationView{
                List {
                    ForEach(0..<listName.count) { index in
                       Text(String(listName[index]))
                       .listRowBackground(Color.green)
                    }
                }
                .navigationTitle(myNavigationTitle)
            }
            .padding(.bottom, 0.1)
            .padding(.top, 0.1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
