//
//  MemoryMapManagerView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 16/12/2024.
//

import Foundation
import MapKit

class MemoryManager: ObservableObject {
    
    @Published var memories = previewMemories

    var mapRegion: MKCoordinateRegion {
        guard !memories.isEmpty else {
            return region
        }

        let latitudes = memories.map { $0.localisation.latitude }
        let longitudes = memories.map { $0.localisation.longitude }

        let centerLatitude = (latitudes.min()! + latitudes.max()!) / 2
        let centerLongitude = (longitudes.min()! + longitudes.max()!) / 2

        let deltaLatitude = (latitudes.max()! - latitudes.min()!) * 1.2 // marge de 20%
        let deltaLongitude = (longitudes.max()! - longitudes.min()!) * 1.2 // marge de 20%

        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude),
            span: MKCoordinateSpan(latitudeDelta: max(deltaLatitude, 0.01), longitudeDelta: max(deltaLongitude, 0.01))
        )
    }
    
    func mapRect(from region: MKCoordinateRegion) -> MKMapRect {
        let topLeft = CLLocationCoordinate2D(
            latitude: region.center.latitude + (region.span.latitudeDelta / 2),
            longitude: region.center.longitude - (region.span.longitudeDelta / 2)
        )
        let bottomRight = CLLocationCoordinate2D(
            latitude: region.center.latitude - (region.span.latitudeDelta / 2),
            longitude: region.center.longitude + (region.span.longitudeDelta / 2)
        )

        let a = MKMapPoint(topLeft)
        let b = MKMapPoint(bottomRight)

        return MKMapRect(
            x: min(a.x, b.x),
            y: min(a.y, b.y),
            width: abs(a.x - b.x),
            height: abs(a.y - b.y)
        )
    }

    func loadPreviewMemories() {
        memories = previewMemories
    }
}
