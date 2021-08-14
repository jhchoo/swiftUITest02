//
//  S03CategoryHome.swift
//  swiftuiTest02
//
//  Created by jae hwan choo on 2021/08/11.
//

import SwiftUI

struct S03CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        List {
            ZStack {
                NavigationLink(destination: S01AppleLandmarkDetail(landmark: modelData.landmarks[0])) {}
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            }
            .listRowInsets(EdgeInsets())
            
            // 리스트 안에서 ForEach를 사용 할 때에는 , id: \.self를 꼭 써준다. 용도는 delegate와 비슷하다.
            // 해당 뷰의 위치를 특정하기 위해 사용된다.
            ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                CategoryRow(categoryName: key, items: modelData.categories[key]!)
            }
            .listRowInsets(EdgeInsets())
        }
        .navigationTitle("Featured")
    }
}

struct S03CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        S03CategoryHome()
            .environmentObject(ModelData())
    }
}
