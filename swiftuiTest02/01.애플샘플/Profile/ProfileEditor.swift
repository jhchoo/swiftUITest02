//
//  ProfileEditor.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/16.
//

import SwiftUI

struct ProfileEditor: View {
    // 바인딩 했어...
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // 데이터를 만들고 화면을 만들면 되는데
            // 화면을 만들고 데이터 오류나면 클린해야 한다.
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
            
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        // 프로필 편집기를 포함하고 프로필 바인딩을 전달 하도록 조건부 콘텐츠를 업데이트합니다 .ProfileHost
        ProfileEditor(profile: .constant(.default))
      }
}
