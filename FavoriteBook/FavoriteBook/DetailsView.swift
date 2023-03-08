//
//  DetailsView.swift
//  FavoriteBook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import SwiftUI

struct DetailsView: View {
    var chosenFavoriteElement : FavoriteElements
    var body: some View {
        VStack{
            Image(chosenFavoriteElement.imageName).resizable().aspectRatio( contentMode: .fit).frame(width: UIScreen.main.bounds.width/1.5)
            Text(chosenFavoriteElement.name).font(.largeTitle).padding()
            Text(chosenFavoriteElement.description)
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(chosenFavoriteElement: blackpink)
    }
}
