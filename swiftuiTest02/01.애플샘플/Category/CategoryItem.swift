//
//  CategoryItem.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/14.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: LandmarkVO
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryItem(landmark: ModelData().landmarks[0])
        }
        .previewLayout(.fixed(width: 170, height: 220))
    }
}
