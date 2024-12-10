//
//  MemoryView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 09/12/2024.
//

import SwiftUI
import MapKit

struct MemoryView: View {
    let memory : Memory
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            if let image = memory.image{
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .overlay {
                        MapView(memory: memory)
                            .offset(x: 122, y: 90)
                    }
            }
            HStack{
                Text(memory.title)
                    .font(.title2)
                    .bold()
                Spacer()
                ForEach(0...5, id: \.self){ index in
                    Image(systemName: index < memory.note ? "star.fill" : "star")
                        .padding(.horizontal, -3)
                        .foregroundStyle(.customRed)
                }
            }
            .padding(.top, 20)
            Text(memory.description)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
}

#Preview {
    MemoryView(memory: previewMemories[2])
        .padding()
}
