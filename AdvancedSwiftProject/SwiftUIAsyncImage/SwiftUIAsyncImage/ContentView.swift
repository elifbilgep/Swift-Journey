//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Elif Bilge Parlak on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/74/Earth_poster_large.jpg")!) { image in
                    image.resizable().frame(width:300,height: 300, alignment: .center)
                } placeholder: {
                    ProgressView()
                }

                List(superHeroArray){ superHero in
                    Text(superHero.name)
                }.navigationTitle("Super Hero Book")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
