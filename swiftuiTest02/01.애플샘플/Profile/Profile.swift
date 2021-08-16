//
//  Profile.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/14.
//
/*
 Swift는 method와 property에 static접두사를 사용하여 인스턴스(instance)가 아닌 선언된 type과 연결할 수 있도록 합니다.
 static property를 이용하여 object의 singleton 또한 만들 수 있는데,
 이것은 아마 들어봤듯이 거대한 안티 패턴(anti-pattern)입니다.
 그렇다면 인스턴스(instance)가 아닌 type에 정의된 property나 method를 언제 사용해야 할까요?
 이 글에서는 정적 프로퍼티와 메소드에 대한 몇 가지 사용 사례를 다룹니다.
 그리고 공유 인스턴스 (shared instance)와 singleton에 대해 살펴봅니다.
 */

import Foundation

struct Profile {
    // default란 글자는 약속어이기 때문에 변수로 사용될 수 없는데....
    // 싱글쿼테이션으로 묶으면 사용할 수도 있도록 만들었다....
    // 헷갈리지 않나??
    static let `default` = Profile(username: "g_kumar")
    
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()


    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { self.rawValue }
    }
}
