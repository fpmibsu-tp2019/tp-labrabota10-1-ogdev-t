//
//  MapViewController.swift
//  checkITin
//
//  Created by artloko on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: ViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 25000
    var currentRoute: MKRoute? = nil
    let locationManager = CLLocationManager()
    var currCoordinates: CLLocationCoordinate2D = CLLocation(latitude: 53.893842, longitude: 27.546772).coordinate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        centerMapOnLocation(currCoordinates: currCoordinates)
        loadAnnotations()
        
        // Do any additional setup after loading the view.
    }
    
    func centerMapOnLocation(currCoordinates: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegion(center: currCoordinates, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func loadAnnotations() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let objects = try managedContext.fetch(NSFetchRequest(entityName:"Sight")) as! [NSManagedObject]
            for object in objects {
                let sight = SightStruct(dbObject: object)
                mapView.addAnnotation(sight)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func onCityRouteRequested(sender: UIButton) {
        let sight = mapView.selectedAnnotations[0] as! SightStruct
        if currentRoute != nil {
            mapView.removeOverlay(currentRoute!.polyline)
        }
        
        currentRoute = RouteHelper.findRouteTo(minskCoord: currCoordinates, sight: sight)
        if currentRoute != nil {
            mapView.addOverlay(currentRoute!.polyline)
        }
    }
    
    func enableLocationServices() {
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            break
            
        case .authorizedWhenInUse:
            break
            
        case .authorizedAlways:
            break
        }
    }
    
    func escalateLocationServiceAuthorization() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? SightStruct else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
            
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            
            let routeButton = UIButton(type: .contactAdd)
            view.leftCalloutAccessoryView = routeButton
            routeButton.addTarget(self, action: #selector(onCityRouteRequested), for: .touchDown)
            
        }
        
        return view
    }
}
