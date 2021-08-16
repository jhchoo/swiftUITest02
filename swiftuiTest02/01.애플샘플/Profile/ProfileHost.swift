//
//  ProfileHost.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/14.
//

import SwiftUI

struct ProfileHost: View {
    /*
     편집 전파 지연
     사용자가 편집 모드를 종료할 때까지 편집 내용이 적용되지 않도록 하려면 편집하는 동안 프로필의 초안 사본을 사용한 다음 사용자가 편집을 확인할 때만 초안 사본을 실제 사본에 할당합니다.
     */
    // 추가 Environment환경 오프 키가 있다고보기 속성을 \.editMode 줍니다.
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData

// 이걸 이제 바인딩에서 사용하네..
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                          Spacer()
                          EditButton()
                      }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                //
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
