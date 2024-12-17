//
//  MemoriesView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//

//
//  MemoriesView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//

import SwiftUI

struct MemoriesView: View {
    @EnvironmentObject var memoriesVM : MemoryModelVIew
    let locationManage = LocationManagerView()
    @State private var cityName: String? = nil
    @State private var isAdd = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ForEach(memoriesVM.memories) { memory in
                    VStack{
                        NavigationLink(destination: MemoryDetailView(memory: memory)) {
                            MemoryView(memory: memory)
                                .padding(.bottom, 20)
                                .onAppear {
                                    locationManage.getCityName(from: memory.localisation) { name in
                                        self.cityName = name
                                    }
                                }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
            .listStyle(.plain)
            .navigationTitle(cityName ?? "Memories")
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
