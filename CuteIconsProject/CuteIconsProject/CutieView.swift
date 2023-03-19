//
//  CutieView.swift
//  CuteIconsProject
//
//  Created by Elif Bilge Parlak on 19.03.2023.
//

import SwiftUI

struct CutieView: View {
    let cutie : Cutie
    
    var body: some View {
        
        HStack{
            CircleImageView(image: Image(cutie.image)).frame(width: 100, height: 150, alignment: .center).padding(50)
           Spacer()
            VStack{
                
                Text(cutie.name).font(.largeTitle).fontWeight(.bold).foregroundColor(.purple)
                Text(cutie.realName)
            }
            Spacer()
        }.frame(width: UIScreen.main.bounds.width ,alignment: .center)
    }
}

struct CutieView_Previews: PreviewProvider {
    static var previews: some View {
        CutieView(cutie: cat)
    }
}
