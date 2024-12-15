//
//  Travel_diaryApp.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 05/12/2024.
//

import SwiftUI

@main
struct Travel_diaryApp: App {
    @StateObject public var memoriesVM = MemoryModelVIew()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(memoriesVM)
        }
    }
}
