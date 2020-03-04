//
//  ContentView.swift
//  ListProjectSample
//
//  Created by iDev0 on 2020/03/04.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var appleDevices = ["iPad", "iPhone", "appleWatch", "iPods", "Macbook", "iMac"]
    
    func addRow() {
        self.appleDevices.append("Macbook Pro")
    }
    
    
    func CreateAddButton() -> Button<Image> {
        let addButton = Button(action: {
            self.addRow()
        }) {
            Image(systemName: "plus")
        }
        return addButton
    }
         
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(appleDevices, id: \.self) { device in
                    NavigationLink(destination: NaviDetailView(device)) {
                        // 상세보기 구현 (Detail View)
                        Image(systemName: "cloud.rain")
                        Text(device)
                    }
                }
                .onMove { (indexSet, index) in
                    self.appleDevices.move(fromOffsets: indexSet, toOffset: index)
                }
                .onDelete { indexSet in
                    self.appleDevices.remove(atOffsets: indexSet)
                }.padding()
            
            }
            .navigationBarTitle(Text("AppleDevices"))
            .navigationBarItems(leading: CreateAddButton(), trailing: EditButton())

        }
    }
}

struct NaviDetailView : View {
    
    private var device: String = ""
    
    init(_ device: String) {
        self.device = device
    }
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.rain")
            Divider()
            Text(self.device)
        }.padding()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
