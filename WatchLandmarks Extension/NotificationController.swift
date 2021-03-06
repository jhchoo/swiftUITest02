//
//  NotificationController.swift
//  WatchLandmarks Extension
//
//  Created by jae hwan choo on 2021/08/17.
//

import WatchKit
import SwiftUI
import UserNotifications

// 와치 알람 컨트롤러
class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: LandmarkVO?
      var title: String?
      var message: String?
    
    let landmarkIndexKey = "landmarkIndex"

    
    override var body: NotificationView {
        return NotificationView()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()

        let notificationData =
            notification.request.content.userInfo as? [String: Any]

        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]

        title = alert?["title"] as? String
        message = alert?["body"] as? String

        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }

    }
}
