//
//  mapsViewController.swift
//  SMC
//
//  Created by Sanjay Shrestha on 3/28/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class mapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(latitude: 37.841347,longitude: -122.110135)
        let span = MKCoordinateSpanMake(0.004, 0.004)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        let marker = MKPointAnnotation()
        
        marker.coordinate = location
        marker.title = "Saint Marys College of California"
        marker.subtitle = "1928 St Marys Rd, Moraga, CA 94556, USA"
        mapView.addAnnotation(marker)
        
    }
    
    
    
    //need to add direction to here button


}
