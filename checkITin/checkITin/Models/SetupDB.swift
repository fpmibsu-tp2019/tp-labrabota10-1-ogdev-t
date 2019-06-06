//
//  SetupDB.swift
//  checkITin
//
//  Created by artloko on 6/5/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SetupDB{
    static func setup(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let count = try managedContext.count(for: NSFetchRequest(entityName: "Sight"))
            if count == 0 {
                let entity = NSEntityDescription.entity(forEntityName: "Sight", in: managedContext)!
                
                let library = NSManagedObject(entity: entity, insertInto: managedContext)
                library.setValue("National Library of Belarus", forKey: "name")
                library.setValue("The National Library of Belarus is the biggest library in the Republic of Belarus.", forKey: "sightShortDescription")
                library.setValue("The National Library of Belarus is the biggest library in the Republic of Belarus. The library is located in Minsk, the capital of Belarus. It houses the largest collection of Belarusian printed materials and the third largest collection of books in Russian behind the Russian State Library and the Russian National Library.", forKey: "sightDescription")
                library.setValue("library", forKey: "imageName")
                library.setValue(false, forKey: "visited")
                library.setValue(53.9313, forKey: "latitude")
                library.setValue(27.6461, forKey: "longitude")
                
                let arena = NSManagedObject(entity: entity, insertInto: managedContext)
                arena.setValue("Minsk-Arena", forKey: "name")
                arena.setValue("Minsk-Arena, known locally as the Botvinik Arena, is the main indoor arena in Minsk, Belarus.", forKey: "sightShortDescription")
                arena.setValue("Minsk Arena, known locally as the Botvinik Arena is the main indoor arena in Minsk, Belarus. Along the main arena, the Minsk-Arena complex includes four venues which are the arena itself (hosting 15,000 spectators), a cycling track (hosting 2,000 spectators), a skating stadium (3,000 spectators) and a multilevel parking structure.", forKey: "sightDescription")
                arena.setValue("arena", forKey: "imageName")
                arena.setValue(false, forKey: "visited")
                arena.setValue(53.9362, forKey: "latitude")
                arena.setValue(27.4820, forKey: "longitude")
                
                let kostel = NSManagedObject(entity: entity, insertInto: managedContext)
                kostel.setValue("Church of Saints Simon and Helena", forKey: "name")
                kostel.setValue("Church of Saints Simon and Helena also known as the Red Church is a Roman Catholic church...", forKey: "sightShortDescription")
                kostel.setValue("Church of Saints Simon and Helena also known as the Red Church is a Roman Catholic church on Independence Square in Minsk, Belarus. This neo-Romanesque church was designed by Polish architects Tomasz Pajzderski and Władysław Marconi. The cornerstone was laid in 1905 and the church was completed in 1910. The bricks for its walls were sourced from Częstochowa, whilst the roof tiles came from Włocławek.", forKey: "sightDescription")
                kostel.setValue("kostel", forKey: "imageName")
                kostel.setValue(false, forKey: "visited")
                kostel.setValue(53.8965, forKey: "latitude")
                kostel.setValue(27.5475, forKey: "longitude")
                
                try managedContext.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func deleteData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sight")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try managedContext.execute(deleteRequest)
            try managedContext.save()
        }catch {
            print("Mistake while deleting")
        }
    }
    
    static func setVisited(sightName: String, isTrue: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sight")
        fetchRequest.predicate = NSPredicate(format: "name = %@", sightName)
        do {
            let test = try managedContext.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            if isTrue {
                objectUpdate.setValue(true, forKey: "visited")
            }
            else {
                objectUpdate.setValue(false, forKey: "visited")
            }
            try managedContext.save()
        }catch{
            print(error)
        }
    }
    
    static func getData() -> [SightStruct]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sight")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            var sights : [SightStruct] = []
            
            for data in result as! [NSManagedObject] {
                sights.append(SightStruct(dbObject: data))
            }
            return sights
        } catch{
            return []
        }
    }
}
