//
//  SwiftUIView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//


import SwiftUI
import MapKit

struct SummeryView: View {
    @StateObject var memoryManager = MemoryManager()
    @State private var mapPosition: MapCameraPosition = .automatic
    
    var body: some View {
        NavigationStack {
            Map(position: $mapPosition) {
                ForEach(memoryManager.memories, id: \.id) { memory in
                    Annotation("", coordinate: memory.localisation) {
                        // Contenu visuel de l'annotation
                        NavigationLink(destination: MemoryDetailView(memory: memory)) {
                            ImageAnotation(memory: memory)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .onAppear {
                memoryManager.loadPreviewMemories()
                updateMapPosition()
            }
            .toolbar(.hidden)
        }
    }
    
    private func updateMapPosition() {
        let region = memoryManager.mapRegion
        let mapRect = memoryManager.mapRect(from: region)
        mapPosition = .rect(mapRect)
    }
}

#Preview {
    SummeryView()
}
