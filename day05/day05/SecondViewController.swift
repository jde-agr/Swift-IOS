//
//  SecondViewController.swift
//  day05
//
//  Created by jasmine DE-AGRELA on 2019/10/14.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//Lat -33.90740025      -33.9071
//Long 18.41660453      18.4173

class CustomPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: String?
    
    init(pinTitle: String, pinSubTitle: String, location: CLLocationCoordinate2D, pinType: String) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
        self.type = pinType
    }
}

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    let userRegionInMeters: Double = 1000
    var selectedLocation: String = ""
    var pinnedLocations: [CustomPin] = []
    
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else if sender.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = tabBarController as! BaseTabBarViewController
//        print("This selected location \(tabbar.selectedLocation)\n\n")
//        print("Table \(tabbar.pinnedLocations)")
        checkLocationServices(tabbar: tabbar)
        for elem in tabbar.pinnedLocations {
            self.mapView.addAnnotation(elem)
        }
        self.mapView.delegate = self
        print("Location selected: \(selectedLocation)")
        if (tabbar.selectedPin != nil) {
            let center = tabbar.selectedPin!.coordinate
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
//        print("Annotation stuff: \(annotation)")
        let pin = annotation as! CustomPin
        if pin.type == "Education" {
            annotationView.image = UIImage(named: "pika")
        } else if pin.type == "Nature" {
            annotationView.image = UIImage(named: "bulba")
        } else if pin.type == "Historical" {
            annotationView.image = UIImage(named: "squirt")
        } else {
            annotationView.image = UIImage(named: "charm")
        }
        annotationView.canShowCallout = true
        return annotationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! BaseTabBarViewController
        print("This selected location \(tabbar.selectedLocation)")
        if (tabbar.selectedPin != nil) {
            let center = tabbar.selectedPin!.coordinate
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(tabbar: BaseTabBarViewController) {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationManager()
            checkLocationAuthorization(tabbar: tabbar)
            print("Location enabled")
        } else {
            print("Location NOT enabled")
        }
    }
    
    func checkLocationAuthorization(tabbar: BaseTabBarViewController) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            if (tabbar.selectedPin == nil) {
                centerViewOnUserLocation()
                locationManager.startUpdatingLocation()
            }
//            print("This is in use")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        @unknown default:
            break
        }
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: userRegionInMeters, longitudinalMeters: userRegionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    @IBAction func resetToCurrentLocation(_ sender: UIButton) {
        centerViewOnUserLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let tabbar = tabBarController as! BaseTabBarViewController
        checkLocationAuthorization(tabbar: tabbar)
    }


}

