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
