//
//  WebService.swift
//  CryptoCrazySwiftUI
//
//  Created by Elif Bilge Parlak on 26.03.2023.
//

import Foundation

class WebService{
    
    func downloadCurrenciesContinuaton(url: URL) async throws -> [CryptoCurrency]{
        
        try await withCheckedThrowingContinuation({ continuation in
            downloadCurrencies(url: url) { result in
                switch result{
                case .success(let cryptos):
                    continuation.resume(returning: cryptos ?? [])
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
    /*
    func downloadCurrenciesAsync(url: URL) async throws -> [CryptoCurrency]{
        let (data , _) = try await URLSession.shared.data(from: url)
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }*/
    
   func downloadCurrencies(url : URL, completion: @escaping (Result<[CryptoCurrency]?,DownloadError>) -> Void ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data , error == nil else{
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else{
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
    
    enum DownloadError : Error{
        case badUrl
        case noData
        case dataParseError
    }
}
