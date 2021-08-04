//
//  FavoriteButton.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/04.
//

import SwiftUI

struct FavoriteButton: View {
    // 버튼의 현재 상태를 나타내는 바인딩을 추가 하고 미리보기에 상수 값을 제공합니다.isSet
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
