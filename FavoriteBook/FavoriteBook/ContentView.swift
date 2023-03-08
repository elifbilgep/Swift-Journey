//
//  ContentView.swift
//  FavoriteBook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            List{
                ForEach(myFavorites){ favorite in
                    Section(header: Text(favorite.title)) {
                        ForEach(favorite.elements){ element in
                            NavigationLink(destination: DetailsView(chosenFavoriteElement: element)){
                                Text(element.name)
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("Favorites")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
