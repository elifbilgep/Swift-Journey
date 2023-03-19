//
//  Interactor.swift
//  CryptoViper
//
//  Created by Elif Bilge Parlak on 14.03.2023.
//

import Foundation

//Class protocol
//talks to -> Presenter
protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CryptoInteractor : AnyInteractor{
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else{
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do{
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            }catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }
    
}
