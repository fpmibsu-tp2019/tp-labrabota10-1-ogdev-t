//
//  RouteHelper.swift
//  checkITin
//
//  Created by artloko on 6/6/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import Foundation
import MapKit

class RouteHelper {
    
    static func findRouteTo(minskCoord: CLLocationCoordinate2D, sight: SightStruct) -> MKRoute? {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: minskCoord))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: sight.coordinate))
        request.transportType = .automobile
        
        var route: MKRoute? = nil
        let directions = MKDirections(request: request)
        directions.calculate { (response:MKDirections.Response!, error: Error!) -> Void in
            if error == nil {
                route = response.routes[0]
            }
        }
        
        while (directions.isCalculating) {}
        return route
    }
}
