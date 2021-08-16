//
//  S03CategoryHome.swift
//  swiftuiTest02
//
//  Created by jae hwan choo on 2021/08/11.
//

import SwiftUI

struct S03CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        List {
//            ZStack {
//                NavigationLink(destination: S01AppleLandmarkDetail(landmark: modelData.landmarks[0])) {}
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//            }
//            .listRowInsets(EdgeInsets())

            PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
            .listRowInsets(EdgeInsets())

            // 리스트 안에서 ForEach를 사용 할 때에는 , id: \.self를 꼭 써준다. 용도는 delegate와 비슷하다.
            // 해당 뷰의 위치를 특정하기 위해 사용된다.
            ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                CategoryRow(categoryName: key, items: modelData.categories[key]!)
            }
            .listRowInsets(EdgeInsets())
        }
        // 리스트 스타일을 지정할 수 있다.
        .listStyle(InsetListStyle()) // https://seons-dev.tistory.com/139
        .navigationTitle("Featured")
        .toolbar {
            Button(action: {
                    showingProfile.toggle()
            }) {
                Image(systemName: "person.crop.circle")
                    .accessibilityLabel("User Profile")
            }
        }
        .sheet(isPresented: $showingProfile) {
            // 이게... PUSH 이동이네..
            ProfileHost()
                .environmentObject(modelData)
        }
    }
}

struct S03CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        S03CategoryHome()
            .environmentObject(ModelData())
    }
}
