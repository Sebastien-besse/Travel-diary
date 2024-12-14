//
//  ButtonAddPicture.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 13/12/2024.
//

import Foundation
import SwiftUI
import PhotosUI

struct ButtonAddPicture: View{
    @Binding var isShowingConfirmationDialog : Bool
    @Binding var isShowingPhotoPicker : Bool
    @Binding var photoItem : PhotosPickerItem?
    @Binding var isShowingCamera : Bool
    @Binding var image : Image?
    var body: some View {
        VStack{
            if let image{
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }else{
                Button {
                    isShowingConfirmationDialog.toggle()
                } label: {
                    Image(systemName: "photo.badge.plus")
                        .font(.system(size: 40))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .background(.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .confirmationDialog("Comment souhaitez-vous ajouter une photo ?", isPresented: $isShowingConfirmationDialog, titleVisibility: .visible) {
                    Button("Prendre une photo") {
                        isShowingCamera.toggle()
                    }
                    Button("Importer de la bibliothèque") {
                        isShowingPhotoPicker.toggle()
                    }
                    Button("Retour", role: .cancel){}
                }
            }
        }
        .photosPicker(isPresented: $isShowingPhotoPicker, selection: $photoItem, matching: .images)
        .onChange(of: photoItem){
            Task{
                do{
                    if let data = try await photoItem? .loadTransferable(type: Data.self),
                        let uIImage = UIImage(data: data){
                            image = Image(uiImage: uIImage)
                        }
                    print("Image importer")
                    }catch{
                    print("Image introuvable")
                }
            }
        }
        .sheet(isPresented: $isShowingCamera) {
            CameraView{ pickedItem in
                if let UIImage = pickedItem{
                    image = Image(uiImage: UIImage)
                }
                isShowingCamera = false
            }
        }
    }
}

#Preview {
    ButtonAddPicture(isShowingConfirmationDialog: .constant(false), isShowingPhotoPicker: .constant(false), photoItem: .constant(nil), isShowingCamera: .constant(false), image: .constant(nil))
}
