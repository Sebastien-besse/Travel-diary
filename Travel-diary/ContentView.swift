//
//  ContentView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 05/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MemoriesView()
                .tabItem {
                    Label("My Memories", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
