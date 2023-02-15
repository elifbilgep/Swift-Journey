//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Elif Bilge Parlak on 13.02.2023.
//

import UIKit

class DetailsVC: UIViewController{

    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedSimpson?.name
        imageView.image = selectedSimpson?.image
        jobLabel.text = selectedSimpson?.job
    }
    
}
