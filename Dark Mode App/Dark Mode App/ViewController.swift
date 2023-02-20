//
//  ViewController.swift
//  Dark Mode App
//
//  Created by Elif Bilge Parlak on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
    }
    

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle =   traitCollection.userInterfaceStyle
         if userInterfaceStyle == .dark{
             changeButton.tintColor = UIColor.white
         }else{
             changeButton.tintColor = UIColor.systemPink
         }
    }

}

