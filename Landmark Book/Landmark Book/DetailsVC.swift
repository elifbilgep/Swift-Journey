//
//  DetailsVC.swift
//  Landmark Book
//
//  Created by Elif Bilge Parlak on 12.02.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkImage: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedUIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        landmarkLabel.text = selectedLandmarkName
        landmarkImage.image = selectedUIImage
        
    }
    

    
}
