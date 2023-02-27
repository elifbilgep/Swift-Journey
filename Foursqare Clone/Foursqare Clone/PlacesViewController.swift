//
//  PlacesViewController.swift
//  Foursqare Clone
//
//  Created by Elif Bilge Parlak on 27.02.2023.
//

import UIKit
import Parse

class PlacesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var placeNameArray = [String]()
    var placeIdArray = [String]()
    var selectedId = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "log out",style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOutButtonClicked))
        
        getDataFromParse()
    }
    
    @objc func addButtonClicked(){
        self.performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
        //segue
    }
    
    @objc func logOutButtonClicked(){
        PFUser.logOutInBackground { error in
            if error != nil{
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "error")
            }else{
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = placeNameArray[indexPath.row]
        content.secondaryText = placeIdArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    
    func getDataFromParse(){
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { objects, error in
            if error != nil{
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "error")
            }else{
                if objects != nil{
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIdArray.removeAll(keepingCapacity: false)
                    for object in objects!{
                        if let placeName = object.object(forKey: "name") as? String{
                            if let placeId = object.objectId{
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                            }
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func makeAlert(title: String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenPlaceId = selectedId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedId = placeIdArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
}
