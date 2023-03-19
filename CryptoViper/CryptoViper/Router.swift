//
//  Router.swift
//  CryptoViper
//
//  Created by Elif Bilge Parlak on 14.03.2023.
//

import Foundation
import UIKit

//class protocol
//entry point (first screen to open)

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{ // ben bu protokolu oluşturduktan sonra stediğim sınıfta uygulayabilirm
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}


class CryptoRouter : AnyRouter{
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        //tüm herşeyi birbirine bağlama yeri
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
         
        return router
        
    }
    
}
