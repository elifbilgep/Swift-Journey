//
//  ViewController.swift
//  MachineLearningImageRecognition
//
//  Created by Elif Bilge Parlak on 28.02.2023.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func onChangeClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        
        if let ciImage = CIImage(image: imageView.image!){
            chosenImage = ciImage
        }
        
        recogniseImage(image: chosenImage)
    }
    
    func recogniseImage(image: CIImage){
        //1) Request oluştur
        //2) Handler
        
        resultLabel.text = "Findin.."
        
        if let model = try? VNCoreMLModel(for: MobileNetV2().model){
            //1) Request
            let request = VNCoreMLRequest(model: model) { vnRequest, error in
                if let results = vnRequest.results as? [VNClassificationObservation]{
                    if results.count > 0{
                        print("results count: \(results.count)")
                        let topResult = results.first
                        
                      
                        DispatchQueue.main.async {
                            let confidenceLevel = (topResult?.confidence ?? 0) * 100
                            
                            let rounded = Int(confidenceLevel * 100) / 100
                            
                            self.resultLabel.text = "\(rounded)% its \(topResult!.identifier)"
                        }
                    }
                    
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                do{
                    try handler.perform([request])
                }catch{
                    print("error")
                }
                
            }
        }

    }
}

