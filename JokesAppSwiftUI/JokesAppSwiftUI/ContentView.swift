//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by Elif Bilge Parlak on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationView{
            List(jokesVM.jokes) { element in
                Text(element.joke)
            }
            .toolbar{
                Button(action: addJoke){
                    Text("Get New Joke")
                }
            }
            .navigationTitle("Jokes App")
        }
    }
    
    func addJoke(){
        jokesVM.getJokes()
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

