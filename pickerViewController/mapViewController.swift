//
//  mapViewController.swift
//  pickerViewController
//
//  Created by Aaryan Kothari on 07/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController {
    
    //Variables
    var lat = Double()
    var lon = Double()
    var country = String()
    
    //Outlets
    @IBOutlet weak var barTitle: UINavigationItem!
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        
    super.viewDidLoad()
    
    setupMap()
    
    barTitle.title = country
        
    }
    
    func setupMap(){
    let annotation = MKPointAnnotation()
        
    let center = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    annotation.coordinate = center
        
    annotation.title = country
        
    annotation.subtitle = "yo"
        
    mapView.addAnnotation(annotation)
    
    let region = MKCoordinateRegion(center: center, latitudinalMeters:  5000000, longitudinalMeters: 5000000 )
    
    mapView.setRegion(region, animated: true)
        
    }

}
