//
//  ImageAnotation.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 16/12/2024.
//

import SwiftUI

struct ImageAnotation: View {
    let memory: Memory
    
    var body: some View {
        ZStack {
            // Fond avec bord arrondi et ombre
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 60, height: 60) // Taille fixe pour le contour
                .shadow(color: Color.gray.opacity(0.6), radius: 5, x: 0, y: 2)
            
            // Image resizable et clipShape pour arrondi
            if let image = memory.image {
                image
                    .resizable()
                    .scaledToFill() // Remplir tout en gardant le ratio
                    .frame(width: 45, height: 45) // Taille de l'image
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Arrondi
            } else {
                // Placeholder si aucune image
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    ImageAnotation(memory: previewMemories[0])
}
