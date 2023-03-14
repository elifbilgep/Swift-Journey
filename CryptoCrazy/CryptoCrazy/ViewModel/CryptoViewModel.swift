//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by Elif Bilge Parlak on 14.03.2023.
//

import Foundation

struct CryptoListViewModel{
    let cryptoCurrencyList : [CryptoCrazy]
    
    func numberOfRows() -> Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(index: Int) -> CryptoViewModel{
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
    
}


struct CryptoViewModel{
    let cryptoCurrency : CryptoCrazy
    
    var name : String{
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}
