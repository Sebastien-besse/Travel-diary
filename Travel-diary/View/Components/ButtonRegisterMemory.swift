//
//  ButtonRegisterMemory.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 15/12/2024.
//

import SwiftUI
import CoreLocation

struct ButtonRegisterMemory: View {
    @Binding var title : String
    @Binding var description : String
    @Binding var note : Int
    @Binding var image : Image?
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var memories : MemoryModelVIew
    
    @Binding var currentCoordinate: CLLocationCoordinate2D
    var body: some View {
        
        Button {
            Task{
                do{
                     try await  memories.addMemory(title: title, image: image, note: note, description: description, location: currentCoordinate)
                    print("Memory enregistré")
                }catch{
                   print("Memory non enregistré")
                }
            }
           
            dismiss()
        } label: {
            Text("Valider")
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.customRed)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ButtonRegisterMemory(
        title: .constant("Islande"),
        description: .constant("île incroyable où la nature règne!"),
        note: .constant(5),
        image: .constant(nil),
        currentCoordinate: .constant(.startPosition)
    )
    .padding()
}
