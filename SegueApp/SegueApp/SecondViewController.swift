//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Elif Bilge Parlak on 22.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }


}
