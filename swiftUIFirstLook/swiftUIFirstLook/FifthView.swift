//
//  FifthView.swift
//  swiftUIFirstLook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "James"
    
    var body: some View {
        VStack{
            Text(myName).font(.largeTitle).padding()
            TextField("placeholder", text: $myName).padding()
        }
    }
} 

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
