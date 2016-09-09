//
//  ViewController.swift
//  UAS Command
//
//  Created by Chee Kiang Tan on 8/9/16.
//  Copyright © 2016 Govtech. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var theMap: MKMapView!
    @IBOutlet weak var Asset1: UIButton!
    @IBOutlet weak var Asset2: UIButton!
    @IBOutlet weak var Asset3: UIButton!
    @IBOutlet weak var label: UILabel!
    
        var manager:CLLocationManager!
        var myLocations: [CLLocation] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //Setup our Location Manager
            manager = CLLocationManager()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestAlwaysAuthorization()
            manager.startUpdatingLocation()
            
            //Setup our Map View
            theMap.delegate = self
            theMap.mapType = MKMapType.Hybrid
            theMap.showsUserLocation = true
        }
        
        func locationManager(manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
            label.text = "\(locations[0])"
            myLocations.append(locations[0] as CLLocation)
            
            let spanX = 0.002
            let spanY = 0.002
            let newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
            theMap.setRegion(newRegion, animated: true)
            
            if (myLocations.count > 1){
                let sourceIndex = myLocations.count - 1
                let destinationIndex = myLocations.count - 2
                
                let c1 = myLocations[sourceIndex].coordinate
                let c2 = myLocations[destinationIndex].coordinate
                var a = [c1, c2]
                let polyline = MKPolyline(coordinates: &a, count: a.count)
                theMap.addOverlay(polyline)
            }
        }
        //Mark Actions
    
    @IBAction func Asset1(sender: AnyObject) {
        let alertControllerSave = UIAlertController(title: "Status", message:
            "UAV request received. ETA 2mins", preferredStyle: UIAlertControllerStyle.Alert)
        alertControllerSave.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertControllerSave, animated: true, completion: nil)
        //task.resume()
    }
    
    @IBAction func Asset2(sender: AnyObject) {
        
        let alertControllerSave = UIAlertController(title: "Status", message:
            "UAV request received. ETA 1min", preferredStyle: UIAlertControllerStyle.Alert)
        alertControllerSave.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertControllerSave, animated: true, completion: nil)
    }
    
    @IBAction func Asset3(sender: AnyObject) {
        let alertControllerSave = UIAlertController(title: "Status", message:
            "UAV request received. ETA 3mins", preferredStyle: UIAlertControllerStyle.Alert)
        alertControllerSave.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertControllerSave, animated: true, completion: nil)    }
    
    
    
}



