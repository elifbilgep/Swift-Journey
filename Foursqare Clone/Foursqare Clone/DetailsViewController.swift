//
//  DetailsViewController.swift
//  Foursqare Clone
//
//  Created by Elif Bilge Parlak on 27.02.2023.
//

import UIKit
import MapKit
import Parse

class DetailsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var detailsMapView: MKMapView!
    @IBOutlet weak var detailsAtmosphereView: UILabel!
    @IBOutlet weak var detailsTypeLabel: UILabel!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    
    var chosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDataFromParse()
        detailsMapView.delegate = self
    }
    
    func getDataFromParse(){
        let query = PFQuery(className: "Places")
         query.whereKey("objectId", equalTo: chosenPlaceId)
         query.findObjectsInBackground { objects, error in
             if error != nil{
                 
             }else{
                 if objects != nil {
                     if objects!.count > 0 {
                         let chosenObject = objects![0]
                         
                         if let placeName = chosenObject.object(forKey: "name") as? String{
                             self.detailsNameLabel.text = placeName
                         }
                         if let placeType = chosenObject.object(forKey: "type") as? String{
                             self.detailsTypeLabel.text = placeType
                         }
                         if let placeAtmosphere = chosenObject.object(forKey: "atmosphere") as? String{
                             self.detailsAtmosphereView.text = placeAtmosphere
                         }
                         if let placeLatitude = chosenObject.object(forKey: "latitude") as? String{
                             if let doublePlaceLatitude = Double(placeLatitude){
                                 self.chosenLatitude = doublePlaceLatitude
                             }
                         }
                         if let placeLongitude = chosenObject.object(forKey: "longitude") as? String{
                             if let doublePlaceLongitude = Double(placeLongitude){
                                 self.chosenLongitude = doublePlaceLongitude
                             }
                         }
                         
                         if let imageData = chosenObject.object(forKey: "image") as? PFFileObject{
                             imageData.getDataInBackground { data, error in
                                 if error == nil{
                                     if data != nil{
                                         self.detailsImageView.image = UIImage(data: data!)
                                     }
                                     
                                 }
                             }
                         }
                         
                         //To Maps
                         
                         let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                         let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                         let region = MKCoordinateRegion(center: location, span: span)
                         self.detailsMapView.setRegion(region, animated: true)
                         
                         let annotation = MKPointAnnotation()
                         annotation.coordinate = location
                         annotation.title = self.detailsNameLabel.text!
                         annotation.subtitle = self.detailsTypeLabel.text!
                         self.detailsMapView.addAnnotation(annotation)
                     }
                     
                 }
             }
         }
    }
    //addingdetails to annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else{
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.chosenLatitude != 0.0 && self.chosenLongitude != 0.0{
            let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error )in
                if let placemark = placemarks{
                    if placemark.count > 0{
                        let mkPlacemark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlacemark)
                        mapItem.name = self.detailsNameLabel.text
                        let launchoptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        mapItem.openInMaps(launchOptions: launchoptions)
                    }
                }
            }
        }
    }
    
}
