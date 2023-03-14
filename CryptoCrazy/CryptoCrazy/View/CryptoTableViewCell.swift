//
//  CryptoTableViewCell.swift
//  CryptoCrazy
//
//  Created by Elif Bilge Parlak on 14.03.2023.
///Users/elifbilgeparlak/SwiftProjects/Swift Learning/CryptoCrazy/CryptoCrazy/ViewController.swift

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
