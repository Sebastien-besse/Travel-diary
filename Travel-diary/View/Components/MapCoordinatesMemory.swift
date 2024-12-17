//
//  MapCoordinatesMemory.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 14/12/2024.
//

import SwiftUI
import MapKit

struct MapCoordinatesMemory: View {
    @State private var position: MapCameraPosition = .region(region)
    @Binding var currentCoordinate: CLLocationCoordinate2D

    var body: some View {
        VStack {
            Map(position: $position) {
                // Annotation pour le mappin
                Annotation("", coordinate: currentCoordinate) {
                    Text("📍")
                        .font(.system(size: 40))
                }
            }
            .onMapCameraChange(frequency: .continuous) { context in
                currentCoordinate = context.region.center
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
    }
}

#Preview {
    MapCoordinatesMemory(currentCoordinate: .constant(.startPosition))
        .padding()
}
