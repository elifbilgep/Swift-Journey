//
//  SnapViewController.swift
//  BasicSnapchatClone
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import UIKit
import ImageSlideshow

class SnapViewController: UIViewController {
    
    var selectedSnap : Snap?
    var selectedTime : Int?
    var inputArray = [KingfisherSource]()

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let time = selectedTime{
            timeLabel.text = "Time left: \(time)"
        }
       
        if let snap = selectedSnap{
            for imgUrl in snap.imageUrlArray{
                inputArray.append(KingfisherSource(urlString: imgUrl)!)
            }
            
            
        }
        
        
        
        let imgSlideshow = ImageSlideshow(frame: CGRect(x: 10, y: 40, width: self.view.frame.width*0.95, height: self.view.frame.width*0.9))
        imgSlideshow.backgroundColor = UIColor.white
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        imgSlideshow.pageIndicator = pageIndicator
        
        imgSlideshow.contentScaleMode = UIViewContentMode.scaleAspectFit
        imgSlideshow.setImageInputs(inputArray)
        self.view.addSubview(imgSlideshow)
        self.view.bringSubviewToFront(timeLabel)
    }
    


}
