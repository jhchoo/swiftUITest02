//
//  S01AppleGuideView.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/02.
//

import SwiftUI
import MapKit

struct S01AppleGuideView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $region)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            Image("namu")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .offset(y: -130)
                .padding(.bottom, -130)
        
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)

                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()

            Spacer()
        }
    }
}

struct S01AppleGuideView_Previews: PreviewProvider {
    static var previews: some View {
        S01AppleGuideView()
    }
}
