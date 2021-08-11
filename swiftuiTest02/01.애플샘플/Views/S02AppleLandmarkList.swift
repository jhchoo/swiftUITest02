//
//  S01AppleLandmarkList.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/04.
//

import SwiftUI

struct S01AppleLandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [LandmarkVO] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
//            List(landmarks) { landmark in
//                NavigationLink(destination: S01AppleLandmarkDetail(landmark: landmark)) {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
        
        List {
            
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
            }
            
            ForEach(filteredLandmarks) { landmark in
                NavigationLink(destination: S01AppleLandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct S01AppleLandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // 여러개의 디바이스를 볼 수 있다.
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            S01AppleLandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
