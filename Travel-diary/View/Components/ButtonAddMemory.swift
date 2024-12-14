//
//  ButtonAddMemory.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//

import SwiftUI

struct ButtonAddMemory: View {
    @Binding var isAdd : Bool
    var body: some View {
        Button {
            isAdd.toggle()
        } label: {
            Image(systemName: "photo.badge.plus")
                .font(.system(size: 20))
                .foregroundStyle(.black)
        }
        .sheet(isPresented: $isAdd) {
            NewMemoryView()
        }
    }
}

#Preview {
    ButtonAddMemory(isAdd: .constant(false))
}
