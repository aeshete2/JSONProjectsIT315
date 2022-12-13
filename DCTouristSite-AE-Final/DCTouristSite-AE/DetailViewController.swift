//
//  DetailViewController.swift
//  DCTouristSite-AE
//
//  Created by user227538 on 12/6/22.
//

import Foundation
import UIKit
import WebKit
import MapKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak var lblTouristSiteName: UILabel!
    
    @IBOutlet weak var wkBrowser: WKWebView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTouristSiteName.text = passedDCTouristSite.TouristSiteName
        
        let siteURL = URL(string: passedDCTouristSite.TouristSiteWebsite)
        let request = URLRequest(url:siteURL!)
        wkBrowser.load(request)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        let tourist_site_latitude = passedDCTouristSite.TouristSiteLatitude
        let tourist_site_longitude = passedDCTouristSite.TouristSiteLongitude
        
        let location = CLLocationCoordinate2D(latitude: tourist_site_latitude, longitude: tourist_site_longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = passedDCTouristSite.TouristSiteName
        mapView.addAnnotation(annotation)
        
    }
    
    var passedDCTouristSite = DCTouristSite()
    
}
