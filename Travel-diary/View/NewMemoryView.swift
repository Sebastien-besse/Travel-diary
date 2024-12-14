//
//  NewMemoryView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 11/12/2024.
//

import SwiftUI
import PhotosUI
import MapKit

struct NewMemoryView: View {
    @State private var isAdd = false
    @State private var title = ""
    @State private var description = ""
    @State private var position : MapCameraPosition = .automatic
    @State private var note = 0
    @State private var image : Image? = nil
    @State private var location : CLLocationCoordinate2D = .glodenGate
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var memories : MemoryModelVIew
    
    @State var isShowingConfirmationDialog = false
    @State var isShowingPhotoPicker = false
    
    @State var photoItem : PhotosPickerItem?
    @State var selectedImage : Image?
    
    @State var isShowingCamera = false
    @State var selectedPhoto : Image?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Nouveau Memory")
                    .font(.largeTitle)
                    .bold()
                
                Divider()
                
                ButtonAddPicture(isShowingConfirmationDialog: $isShowingConfirmationDialog, isShowingPhotoPicker: $isShowingPhotoPicker, photoItem: $photoItem, isShowingCamera: $isShowingCamera, image: $image)
                
                TextField("Titre memory", text: $title)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity)
                HStack{
                    Text("Ajouter une note :")
                        .bold()
                        .padding(.trailing, 45)
                    ForEach(1...5, id: \.self){ index in
                        Image(systemName: note < index ? "star" : "star.fill")
                            .font(.title2)
                            .foregroundStyle(.customRed)
                            .onTapGesture {
                                note = index
                        }
                    }
                }
                TextEditor(text: $description)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 250)
                
                MapCoordinatesMemory()
                
                Button {
                    memories.addMemory(title: title, image: image, note: note, description: description, location: location)
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
            .padding()
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height, alignment: .top)
        }
    }
}

#Preview {
    NewMemoryView()
        .environmentObject(MemoryModelVIew())
}
