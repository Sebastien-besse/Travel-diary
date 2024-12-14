//
//  MemoriesPreviewData.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 06/12/2024.
//

import Foundation
import SwiftUI
import CoreLocation

extension CLLocationCoordinate2D{
    static let glodenGate = CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783)
    static let paintedLadies = CLLocationCoordinate2D(latitude: 37.7763, longitude: -122.4327)
    static let goldenGatePark = CLLocationCoordinate2D(latitude: 37.7694, longitude: -122.4862)
}

let previewMemories = [
    Memory(title: "Golden Gate",
           image: Image("Golden Gate"),
           note: 4,
           description: "On a traversé le Golden Gate Bridge au coucher du soleil. Les rayons dorés illuminaient la baie de San Francisco, et le pont semblait briller dans toute sa splendeur. Le vent frais et la vue panoramique sur l’océan Pacifique ont rendu ce moment tout simplement magique. Une expérience inoubliable qui restera gravée dans ma mémoire.",
           localisation: .glodenGate),
    Memory(
        title: "Painted Ladies",
        image: Image("Painted Ladies"),
        note: 4,
        description: "Un moment magique devant les Painted Ladies, ces maisons victoriennes colorées emblématiques de San Francisco. Le contraste entre leur architecture charmante et la skyline moderne en arrière-plan était époustouflant. On a pique-niqué dans le parc Alamo Square en profitant d'une vue magnifique et d'une ambiance calme et paisible. Une expérience à couper le souffle !",
        localisation: .paintedLadies),
    Memory(
        title: "Golden Gate Park",
        image: Image("Golden Gate Park"),
        note: 5,
        description: "Une promenade relaxante dans le Golden Gate Park, un véritable havre de paix au cœur de San Francisco. Entre les jardins verdoyants, les magnifiques serres et les lacs scintillants, chaque recoin offrait une nouvelle surprise. Nous avons visité le Jardin Japonais, un endroit zen et magnifique, avant de finir par une pause au bord du lac Stow. Une journée ressourçante au milieu de la nature !",
        localisation: .goldenGatePark)
]
