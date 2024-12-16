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
    @State private var title = ""
    @State private var description = ""
    @State private var note = 0
    @State private var image : Image? = nil
    
    @EnvironmentObject var memories : MemoryModelVIew
    
    @State var isShowingConfirmationDialog = false
    @State var isShowingPhotoPicker = false
    
    @State var photoItem : PhotosPickerItem?
    @State var selectedImage : Image?
    
    @State var isShowingCamera = false
    @State var selectedPhoto : Image?
    
    @State var currentCoordinate: CLLocationCoordinate2D = .startPosition

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
                
                ScoreMemory(note: $note)
                
                TextEditor(text: $description)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 250)
                
                MapCoordinatesMemory(currentCoordinate: $currentCoordinate)
                
                ButtonRegisterMemory(title: $title, description: $description, note: $note, image: $image, currentCoordinate: $currentCoordinate)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.nativeBounds.height / 2.2, alignment: .top)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NewMemoryView()
        .environmentObject(MemoryModelVIew())
}
