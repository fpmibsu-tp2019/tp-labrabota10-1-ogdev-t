//
//  SightStruct.swift
//  checkITin
//
//  Created by fpmi on 6/3/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class SightStruct: NSObject, MKAnnotation{
    let name: String?
    let imageName: String?
    let sightDescription : String?
    let sightShortDescription : String?
    
    let title: String?
    
    var visited : Bool
    
    let coordinate: CLLocationCoordinate2D
    
    init(dbObject: NSManagedObject){
        name = dbObject.value(forKey: "name") as?String
        sightShortDescription = dbObject.value(forKey: "sightShortDescription") as? String
        sightDescription = dbObject.value(forKey: "sightDescription") as? String
        imageName = dbObject.value(forKey: "imageName") as? String
        visited = dbObject.value(forKey: "visited") as! Bool
        coordinate = CLLocationCoordinate2D(latitude: dbObject.value(forKey: "latitude") as! Double, longitude: dbObject.value(forKey: "longitude") as! Double)
        
        title = name
        super.init()
    }
    
    var subtitle: String? {
        return nil
    }
    
}

