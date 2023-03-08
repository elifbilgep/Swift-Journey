//
//  ContentView.swift
//  swiftUIFirstLook
//
//  Created by Elif Bilge Parlak on 7.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .center) {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world.")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding()
            Text("Anan")
                .padding()
            Text("Baban")
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
