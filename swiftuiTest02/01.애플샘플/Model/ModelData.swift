//
//  ModelData.swift
//  swiftuiTest02
//
//  Created by jae hwan choo on 2021/08/04.
//

import Foundation
import Combine

// SwiftUI는 뷰에 영향을 줄 수 있는 관찰 가능한 객체의 변경 사항을 감시하고 변경 후 뷰의 올바른 버전을 표시합니다.
final class ModelData: ObservableObject {
    // 이렇게 글로벌 변수로 샘플 사용 한다.
    @Published var landmarks: [LandmarkVO] = load("landmarkData.json")
    
    // 하이킹 데이터를 처음 로드한 후에는 절대 수정하지 않기 때문에 @Published속성 으로 표시할 필요가 없습니다 .
    var hikes: [Hike] = load("hikeData.json")
    
    // 사용자 정보 제공
    @Published var profile = Profile.default
    
    // 리스트를 카테고리에 따라 그룹핑 한다. - 이것도 실시간이네.
    var categories: [String: [LandmarkVO]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [LandmarkVO] {
        landmarks.filter { $0.isFeatured }
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
