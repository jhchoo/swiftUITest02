//
//  S01AppleLandmarkDetail.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/02.
//

import SwiftUI

struct S01AppleLandmarkDetail: View {
    // 수정자가 부모에 적용된 한 속성은 자동으로 값을 가져 옵니다.
    @EnvironmentObject var modelData: ModelData
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: LandmarkVO
    
    var body: some View {
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            if let image = landmark.image {
                CircleImage(image: image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            }
        
            VStack(alignment: .leading) {
                
//                Text(landmark.name)
//                    .font(.title)

                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct S01AppleLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        S01AppleLandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(ModelData())
    }
}
