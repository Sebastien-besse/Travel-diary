//
//  MapView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 06/12/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    let  memory : Memory
    var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: memory.localisation,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        }
    @State var position : MapCameraPosition = .automatic
    var body: some View {
        
        Map(position: $position, interactionModes: []){
            Annotation("", coordinate: memory.localisation) {
                Text("📍")
                    .font(.system(size: 40))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: 100, maxHeight: 100)
        .onAppear{
            position = .region(region)
        }         
    }
}

#Preview {
    MapView(memory: previewMemories[0])
}
