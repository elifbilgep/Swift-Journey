//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Elif Bilge Parlak on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hwasa1: UILabel!
    
    @IBOutlet weak var hwasa_image1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onChangeButton(_ sender: Any) {
        hwasa_image1.image = UIImage(named: "hwasa2")
    }
    
}

