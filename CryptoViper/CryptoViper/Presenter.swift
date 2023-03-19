//
//  Presenter.swift
//  CryptoViper
//
//  Created by Elif Bilge Parlak on 14.03.2023.
//

import Foundation

//class, protocol
// talks to -> interactor, router, view


enum NetworkError : Error{
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter{
    var router : AnyRouter?{get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView?{get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter{
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet{//Atama işlemi tamamlandığında
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result{
        case .success(let cryptos) :
            view?.update(with: cryptos)
            //view upda₺e
        case .failure(_) :
            print("error")
            view?.update(with: "Try Again")
        }
    }
}
