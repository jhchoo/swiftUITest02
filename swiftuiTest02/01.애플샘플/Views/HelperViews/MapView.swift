//
//  MapView.swift
//  swiftuiTest02
//
//  Created by jae hwan choo on 2021/08/04.
//

import SwiftUI
import MapKit

struct MapView: View {
    
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
//        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//    )
    
    var coordinate: CLLocationCoordinate2D
    // @State private var region = MKCoordinateRegion()
    
    // UserDefaults 를 쉽게 사용하자.
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }

    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }

    
    
//    var body: some View {
//
////        Map(coordinateRegion: $region)
//
//        Map(coordinateRegion: $region)
//            .onAppear {
//                setRegion(coordinate)
//            }
//    }
//
//    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
//        region = MKCoordinateRegion(
//            center: coordinate,
//            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//        )
//    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
