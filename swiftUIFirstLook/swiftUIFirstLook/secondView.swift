//
//  secondView.swift
//  swiftUIFirstLook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import SwiftUI

struct secondView: View {
    var body: some View {
        Image("elif")
            .resizable()
            .aspectRatio(contentMode: .fit )
            .frame(width: UIScreen.main.bounds.width * 0.8,height: UIScreen.main.bounds.height / 2)
    }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}
