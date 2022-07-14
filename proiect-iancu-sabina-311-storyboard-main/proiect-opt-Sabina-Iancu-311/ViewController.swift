//
//  ViewController.swift
//  proiect-opt-Sabina-Iancu-311
//
//  Created by user215930 on 4/30/22.
//

import UIKit

//Import for navigation screen
import MapKit
import CoreLocation

//Import for video
import AVKit
import AVFoundation



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Animated Button
    
    //Schedule notifications declarations
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var messageTF: UITextField!
    
    @IBOutlet weak var titleTF:UITextField!
    
    //Declarations for map
    @IBOutlet var mapView: MKMapView!
    
    //Declarations for CollectionView
    @IBOutlet var collectionView: UICollectionView!
    
    
    let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    //Override for navigation screen and video playing
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Navigation screen part
        super.viewDidAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //Video playing part
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
    
        layer.frame = view.bounds
        
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
    }
    
    //Functions for navigation screen
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location  = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
        let region  = MKCoordinateRegion(center: coordinate, span: span)
        
        if mapView != nil {
            mapView.setRegion(region, animated: true)

        }
        else {
            return
        }
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }


}


