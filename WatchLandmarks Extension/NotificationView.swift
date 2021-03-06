//
//  NotificationView.swift
//  WatchLandmarks Extension
//
//  Created by jae hwan choo on 2021/08/17.
//

import SwiftUI

// 와치 알람뷰
struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: LandmarkVO?

    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }

            Text(title ?? "Unknown Landmark")
                .font(.headline)

            Divider()

            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landmark: ModelData().landmarks[0])
        }
    }

}
