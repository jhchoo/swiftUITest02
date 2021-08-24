//
//  ContentView.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/02.
//

import SwiftUI

struct ContentView: View {
    
    let myNavigationTitle = "스위프트UI 테스트"
    let listName:[String] = ["01. 애플 기본 샘플",
                             "02. 애플 리스트 샘플",
                             "03. 애플 복잡한 인터페이스 구성",
                             "04. 정대리 샘플1",
                             "05."]
    enum Tab {
            case featured
            case list
        }
    // var landmark = LandmarkEntity(from: <#Decoder#>)
    
    var body: some View {
        ZStack() {
            Color.red.ignoresSafeArea()
            NavigationView{
                List {
                    ForEach(0..<listName.count) { index in
                        if index == 0 {
                            NavigationLink(listName[index], destination: S01AppleLandmarkDetail(landmark: ModelData().landmarks[0]))
                        } else if index == 1 {
                            NavigationLink(listName[index], destination: S01AppleLandmarkList())
                        } else if index == 2 {
                            NavigationLink(listName[index], destination: S03CategoryHome())
                        } else if index == 3 {
                            NavigationLink(listName[index], destination: S02BasicGuideView())
                        } else {
                           Text(String(listName[index]))
                           .listRowBackground(Color.green)
                            
                            
                        }
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
                .environmentObject(ModelData())
        }
    }
}
