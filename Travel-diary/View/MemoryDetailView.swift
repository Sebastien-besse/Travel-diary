//
//  MemoryDetailView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 17/12/2024.
//

import SwiftUI
import MapKit

struct MemoryDetailView: View {
    let memory : Memory
    var mapRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: memory.localisation, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
    }
    @StateObject var memoryManager = MemoryManager()
    @State var position : MapCameraPosition = .automatic
    var body: some View {
        
        ScrollView{
            
            
            VStack(spacing: 20){
                HStack(alignment: .center){
                    Text(memory.title)
                    
                    
                    VStack{
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.customRed)
                            .overlay {
                                Text("\(String(memory.note))/5")
                                    .font(.subheadline)
                            }
                    }
                    
                }
                .font(.title)
                .bold()
                Divider()
                if let image = memory.image{
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: .infinity, height: 300)
                }
                Text(memory.description)
                    .foregroundStyle(.secondary)
                
                Map(position: $position) {
                    Annotation("", coordinate: memory.localisation) {
                        ImageAnotation(memory: memory)
                    }
                }
                .frame(width: .infinity, height: 300, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onAppear {
                    updateMapPosition()
                }
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            
        }
    }
    private func updateMapPosition() {
        let mapRect = memoryManager.mapRect(from: mapRegion)
        position = .rect(mapRect)
    }
}


#Preview {
    MemoryDetailView(memory: previewMemories[0])
}
