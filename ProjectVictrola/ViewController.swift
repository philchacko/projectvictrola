//
//  ViewController.swift
//  ProjectVictrola
//
//  Created by Phil Chacko on 5/24/15.
//  Copyright (c) 2015 Phil Chacko. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var youtubeView: YTPlayerView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapLabel: UILabel!
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    var playerValues = [
        "controls" : 1,
        "playsinline" : 1,
        "autohide" : 1,
        "showinfo" : 0,
        "modestbranding" : 1
    ]
    
    override func viewWillAppear(animated: Bool) {
        mapView.delegate = self
        mapView.showsUserLocation = true
        var newRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(0.005, 0.005))
        //mapView.setRegion(newRegion, animated: true)
        
        mapLabel.text = "Glyf - Explore Freely"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var videoId = "oH_LfXnklRw"
        
        //Set up location manager.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        //manager.startUpdatingLocation()
        
        // Set up Map View
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        // 1
        let startLocation = CLLocationCoordinate2D(
            latitude: 40.3503271,
            longitude: -74.6526857
        )
        // 2
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: startLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.50007773, longitude: -0.1246402)
        annotation.title = "Big Ben"
        annotation.subtitle = "E9wWBjnaEck"
        mapView.addAnnotation(annotation)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 40.3503271, longitude: -74.6526857)
        annotation2.title = "Friend Center"
        annotation2.subtitle = "cUJXECqcN14"
        mapView.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 40.347804, longitude: -74.661451)
        annotation3.title = "Blair Arch"
        annotation3.subtitle = "yS9IcitP_C0"
        mapView.addAnnotation(annotation3)
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude: 40.348016, longitude: -74.652723)
        annotation4.title = "Quadrangle Club"
        annotation4.subtitle = "fjAdt5j7Ux4"
        mapView.addAnnotation(annotation4)
        
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = CLLocationCoordinate2D(latitude: 40.3504529, longitude: -74.6507161)
        annotation5.title = "E-Quad"
        annotation5.subtitle = "o0gtoWwx5Is"
        mapView.addAnnotation(annotation5)
        
        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = CLLocationCoordinate2D(latitude: 40.3420593, longitude: -74.6608941)
        annotation6.title = "Forbes College"
        annotation6.subtitle = "urLuYPRz7GY"
        mapView.addAnnotation(annotation6)
        
        let annotation7 = MKPointAnnotation()
        annotation7.coordinate = CLLocationCoordinate2D(latitude: 40.346634, longitude: -74.655084)
        annotation7.title = "Frist Campus Center"
        annotation7.subtitle = "E0SD6BlU8d4"
        mapView.addAnnotation(annotation7)
        
        let annotation8 = MKPointAnnotation()
        annotation8.coordinate = CLLocationCoordinate2D(latitude: 40.3481963, longitude: -74.6590868)
        annotation8.title = "Cannon Green"
        annotation8.subtitle = "8erL-Xys5qg"
        mapView.addAnnotation(annotation8)
        
        let annotation9 = MKPointAnnotation()
        annotation9.coordinate = CLLocationCoordinate2D(latitude: 40.347069, longitude: -74.657646)
        annotation9.title = "Princeton University Art Museum"
        annotation9.subtitle = "kzhPSUzHuYc"
        mapView.addAnnotation(annotation9)
        
        let annotation10 = MKPointAnnotation()
        annotation10.coordinate = CLLocationCoordinate2D(latitude: 40.352204, longitude: -74.651874)
        annotation10.title = "Hoagie Haven"
        annotation10.subtitle = "_tHadjDcZRA"
        mapView.addAnnotation(annotation10)
        
        youtubeView.loadWithVideoId(videoId, playerVars: playerValues)
        
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        mapLabel.text = "\(locations[0])"
        myLocations.append(locations[0] as! CLLocation)
        
        let spanX = 0.007
        let spanY = 0.007
        var newRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        mapView.setRegion(newRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        youtubeView.loadWithVideoId(view.annotation.subtitle, playerVars: playerValues)
        mapLabel.text = view.annotation.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

