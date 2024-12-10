//
//  Memory.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 05/12/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Memory: Identifiable{
    let id = UUID()
    let title: String
    let image: Image?
    let note: Int
    let description: String
    var localisation: CLLocationCoordinate2D
}
