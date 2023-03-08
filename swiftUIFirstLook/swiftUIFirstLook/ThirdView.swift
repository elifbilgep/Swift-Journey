//
//  ThirdView.swift
//  swiftUIFirstLook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import SwiftUI

struct ThirdView: View {
    let myArray = ["Elif","Ece","Sude"]
    
    var body: some View {
        /*
         List(myArray, id: \.self){ element in
         Image("elif")
         .resizable()
         .aspectRatio(contentMode: .fit)
         .frame(width: 30,height: 20)
         Text(element).font(.title3)
         }
         */
        
        
         List{
         ForEach(myArray, id: \.self){ element in
         Text(element)
         }
         }
    
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
