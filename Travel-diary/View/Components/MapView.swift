//
//  MapView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 06/12/2024.
//

import SwiftUI
import MapKit

var region: MKCoordinateRegion {
      MKCoordinateRegion(
          center:  CLLocationCoordinate2D(latitude: 0, longitude: 0),
          span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
      )
  }
struct MapView: View {
    let  memory : Memory

    @State var position : MapCameraPosition = .region(region)
    var body: some View {
        
        Map()
                   
    }
}

#Preview {
    MapView(memory: memories[0])
}
