//
//  MemoryModelVIew.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 13/12/2024.
//

import Foundation
import CoreLocation
import SwiftUI

class MemoryModelVIew: ObservableObject{
    
    @Published var memories = previewMemories
    
    func addMemory(title: String, image: Image?, note: Int, description: String, location: CLLocationCoordinate2D){
        let memory = Memory(title: title, image: image, note: note, description: description, localisation: location)
        memories.append(memory)
    }
}
