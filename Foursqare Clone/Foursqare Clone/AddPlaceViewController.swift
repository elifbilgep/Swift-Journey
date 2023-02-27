//
//  AddPlaceViewController.swift
//  Foursqare Clone
//
//  Created by Elif Bilge Parlak on 27.02.2023.
//

import UIKit

class AddPlaceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeAtmosphere: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeImageView.isUserInteractionEnabled = true
        let imageTapRecogniser = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        placeImageView.addGestureRecognizer(imageTapRecogniser)
    }
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeAtmosphere.text != ""{
            if let chosenImage = placeImageView.image{
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeAtmosphere = placeAtmosphere.text!
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeImage = chosenImage
            }
            
            performSegue(withIdentifier: "toMapVC", sender: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: "Invalid", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        
        
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true,completion: nil)
               
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
}
