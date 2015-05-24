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
    
    override func viewWillAppear(animated: Bool) {
        mapView.delegate = self
        mapView.showsUserLocation = true
        var newRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(0.005, 0.005))
        //mapView.setRegion(newRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var videoId = "M7lc1UVf-VE"
        var playerValues = [
            "controls" : 0,
            "playsinline" : 1,
            "autohide" : 1,
            "showinfo" : 0,
            "modestbranding" : 1
        ]
        
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
        let benLocation = CLLocationCoordinate2D(
            latitude: 51.50007773,
            longitude: -0.1246402
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: benLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = benLocation
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

