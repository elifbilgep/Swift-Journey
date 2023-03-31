//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Elif Bilge Parlak on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                Section("Dogs"){
                    ForEach(dogs){ dog in
                        NavigationLink(dog.name, value: dog)
                    }
                }
                Section("Cats"){
                    ForEach(cats){ cat in
                        NavigationLink(cat.name, value: cat)
                    }
                    
                }
            }.navigationDestination(for: Cat.self) { cat in
                Text(cat.name)
            }.navigationDestination(for: Dog.self) { dog in
                Text(dog.name)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
