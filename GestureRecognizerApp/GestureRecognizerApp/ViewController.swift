//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Elif Bilge Parlak on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    var isChanged = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        image.isUserInteractionEnabled = true;
        
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        image.addGestureRecognizer(gestureRecogniser)
    }
    @objc func changePic(){
        if isChanged == true{
            image.image = UIImage(named: "wheein")
            myLabel.text = "Wheein"
            isChanged = false;
        }else {
            isChanged = true
            image.image = UIImage(named: "hwasa1")
            myLabel.text = "Hwasa"
        }
    }

}

 
