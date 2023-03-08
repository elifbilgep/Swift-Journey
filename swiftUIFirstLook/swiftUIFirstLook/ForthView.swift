//
//  ForthView.swift
//  swiftUIFirstLook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import SwiftUI

struct ForthView: View {
    @State var myName = "Elif"
    //artık değiştirelibilir görünüm tekrar render edilir
    // @State -> Property Wrapper
    
    var body: some View {
        VStack{
            Text(myName)
                .font(.largeTitle)
                .padding()
            Button(action: {
                self.myName = "Eda"
            }){
                Text("My Button")
            }
        }
        
    }
}

struct ForthView_Previews: PreviewProvider {
    static var previews: some View {
        ForthView()
    }
}
