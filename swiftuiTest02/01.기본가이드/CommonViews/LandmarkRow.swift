//
//  LandmarkRow.swift
//  swiftuiTest02
//
//  Created by jae hwan choo on 2021/08/04.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: LandmarkEntity

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
