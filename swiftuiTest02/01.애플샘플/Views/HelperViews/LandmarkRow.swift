//
//  LandmarkRow.swift
//  swiftuiTest02
//
//  Created by jae hwan choo on 2021/08/04.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: LandmarkVO

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                            Text(landmark.name)
                                .bold()
                #if !os(watchOS)
                  Text(landmark.park)
                      .font(.caption)
                      .foregroundColor(.secondary)
                  #endif

                        }


            Spacer()
            	
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
