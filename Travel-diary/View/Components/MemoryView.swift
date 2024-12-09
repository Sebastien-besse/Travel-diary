//
//  MemoryView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 09/12/2024.
//

import SwiftUI

struct MemoryView: View {
    let memory : Memory
    var body: some View {
        VStack{
            if let image = memory.image{
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(maxWidth: .infinity, maxHeight: 300)
            }
            HStack{
                Text(memory.title)
                    .font(.title2)
                    .bold()
                Spacer()
                ForEach(0...5, id: \.self){ index in
                    Image(systemName: index < memory.note ? "star.fill" : "star")
                        .foregroundStyle(.teal)
                        
                }
            }
            Text(memory.description)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
     
    }
}

#Preview {
    MemoryView(memory: memories[0])
        .padding()
}
