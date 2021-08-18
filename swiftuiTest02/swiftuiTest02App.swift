//
//  swiftuiTest02App.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/02.
//

import SwiftUI

// 여기서 enum 을 통해 static property를 사용하고 있는 이유는 설정 object를 인스턴스로 만들지 못하도록 하고 싶었기 때문입니다.
enum AppStyles {
  enum Colors {
    static let mainColor = UIColor(red: 1, green: 0.2, blue: 0.2, alpha: 1)
    static let darkAccent = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
  }
  enum FontSizes {
    static let small: CGFloat = 12
    static let medium: CGFloat = 14
    static let large: CGFloat = 18
    static let xlarge: CGFloat = 21
  }
} 
/*
 shared instance는 언제 만드는가
 지금까지 설정(configuration)이나 비싼 object에 static property를 사용할 수 있다는 것과,
 어떻게 static method를 사용하여 간단한 factory를 만들 수 있는지 살펴 보았습니다.
 여기서 더 논란이 되는 주제는 바로 공유 인스턴스에 관한 것입니다. 아마 이 중 몇 가지는 사용해 본적이 있을 것입니다.
 */
@main
struct swiftuiTest02App: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)	
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif

    }
}
