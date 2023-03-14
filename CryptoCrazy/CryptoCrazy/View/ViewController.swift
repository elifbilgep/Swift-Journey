//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Elif Bilge Parlak on 13.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell",for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.currencyLabel.text = cryptoViewModel.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRows()
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurruncies(url: url) { cryptoList in
            if let cryptoList = cryptoList {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoList)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

