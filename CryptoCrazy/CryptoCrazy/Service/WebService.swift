//
//  WebService.swift
//  CryptoCrazy
//
//  Created by Elif Bilge Parlak on 14.03.2023.
//

import Foundation

class WebService{
    
    func downloadCurruncies(url: URL, completion: @escaping ([CryptoCrazy]?)-> () ){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCrazy].self , from: data)
                print(cryptoList)
                if let cryptoList = cryptoList{
                    completion(cryptoList)
                    
                }
            }
        }.resume()
    }
    
}
