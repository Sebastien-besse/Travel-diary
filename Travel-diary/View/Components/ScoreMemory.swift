//
//  ScoreMemory.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 16/12/2024.
//

import SwiftUI

struct ScoreMemory: View {
    @Binding var note : Int
    var body: some View {
        HStack{
            Text("Votre note :")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 30)
            ForEach(1...5, id: \.self){ index in
                Image(systemName: note < index ? "star" : "star.fill")
                    .font(.title2)
                    .foregroundStyle(.customRed)
                    .onTapGesture {
                        note = index
                }
            }
        }
    }
}

#Preview {
    ScoreMemory(note: .constant(4))
}
