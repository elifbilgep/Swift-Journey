//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Elif Bilge Parlak on 22.03.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        NavigationView{
            List(cryptoListViewModel.cryptoList, id: \.id ){ crypto in
                VStack{
                    Text(crypto.currency).font(.title3).foregroundColor(.blue).frame(maxWidth: .infinity,alignment: .leading)
                    Text(crypto.price).frame(maxWidth: .infinity,alignment: .leading)
                    
                }
            }
            
            .toolbar(content: {
                Button {
                    //button clicked
                    Task.init  {
                        cryptoListViewModel.cryptoList = []
                        await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                } label: {
                    Text("Refresh")
                }

            })
            
            .navigationTitle(Text("Crypto Crazy"))
        }.onAppear{//none async
           /* cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!) */
           
        }.task { //async
            await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            
            /*await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
