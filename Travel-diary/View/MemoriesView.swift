//
//  MemoriesView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//

import SwiftUI

struct MemoriesView: View {
    let memories = previewMemories
    var body: some View {
        NavigationStack{
            List{
                ForEach(memories){memory in
                    MemoryView(memory: memory)
                }
                .navigationTitle("San Francisco")
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    MemoriesView()
}
