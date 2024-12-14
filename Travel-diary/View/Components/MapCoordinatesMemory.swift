//
//  MapCoordinatesMemory.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 14/12/2024.
//

import SwiftUI
import MapKit

struct MapCoordinatesMemory: View {
    var body: some View {
        Map()
            .mapStyle(.standard(elevation: .realistic))
        .onMapCameraChange(frequency: .onEnd) {
            
        }
            
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxWidth: .infinity, maxHeight: 300)
    }
}

#Preview {
    MapCoordinatesMemory()
}
