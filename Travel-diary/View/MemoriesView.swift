//
//  MemoriesView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//

import SwiftUI

struct MemoriesView: View {
    @EnvironmentObject var memories : MemoryModelVIew
    let locationManage = LocationManagerView()
    @State private var cityName : String? = nil
    @State private var isAdd = false
    var body: some View {
        NavigationStack{
            List{
                ForEach(memories.memories){memory in
                    MemoryView(memory: memory)
                        .onAppear{
                            locationManage.getCityName(from: memory.localisation) { name in
                                self.cityName = name
                            }
                        }
                }
                .navigationTitle("\(String(describing: cityName ?? ""))")
            }
            .listStyle(.plain)
            .toolbar {
                ButtonAddMemory(isAdd: $isAdd)
            }
        }
    }
}

#Preview {
    MemoriesView()
        .environmentObject(MemoryModelVIew())
}
