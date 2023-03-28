//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Elif Bilge Parlak on 27.03.2023.
//

import Foundation

@MainActor
class CryptoListViewModel : ObservableObject {//Structlar da Observable kullanamıyoruz çünkü bir kalıtım alıyoruz
    let webService = WebService()
    
    @Published var cryptoList = [CryptoViewModel]()//değişiklikleri gözlemenebilir yapar
    
    
    func downloadCryptosContinuation(url: URL) async{
        do{
            let cryptos = try await webService.downloadCurrenciesContinuaton(url: url)
           // DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
           // }
        }catch{
         print(error)
        }
        
    }
    
  /*
    func downloadCryptosAsync(url: URL)async{
        do{
            let cryptos = try await webService.downloadCurrenciesAsync(url: url )
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        }catch{
            print(error)
        }
      
    }*/
    
  /* func downloadCryptos(url: URL){
        webService.downloadCurrencies(url: url) {result in
            switch result{
                case .failure(let error):
                    print(error)
                case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                    
                }
            }
        }
    } */
}

struct CryptoViewModel{
    let crypto : CryptoCurrency
    var id : UUID?{
        crypto.id
    }
    var currency : String{
        crypto.currency
    }
    var price : String{
        crypto.price
    }
}
