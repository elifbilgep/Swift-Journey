//
//  ContentView.swift
//  CuteIconsProject
//
//  Created by Elif Bilge Parlak on 19.03.2023.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    let cutiesArray = [cat,cloud,donut]
    @AppStorage("cutie",store: UserDefaults(suiteName: "group.com.elifbilgeparlak.CuteIconsProject"))
    
    var cutieData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(cutiesArray) { cutie in
                CutieView(cutie: cutie).onTapGesture {
                    saveToDefaults(cutie: cutie)
                }
            }
        }
        .padding() 
    }
    
    func saveToDefaults(cutie: Cutie){
        if let cutieData = try? JSONEncoder().encode(cutie){
            self.cutieData = cutieData
            WidgetCenter.shared.reloadAllTimelines()
        }
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
