//
//  LocationBaseManager.swift
//  Therapy
//
//  Created by Ivan Myrza on 19/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LocationBaseManager {
    
    // SIGN UP DB
       var locationDB: [Location] = []
       
       // APP DELEGATE
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
       // RESAVE
    func resave(identifier: String, amount: String, description: String, electricity: Bool, water: Bool, gasStattion: String, nearby: String, parkingAbility: String) {
           
           let context = appDelegate.persistentContainer.viewContext
           let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "identifier == %@", identifier)
           
           do {
               let request = try context.fetch(fetchRequest) as [Location]
               if request.count > 0 {
                   
                request[0].amount = amount
                request[0].portrait = description
                request[0].electricity = electricity
                request[0].water = water
                request[0].gasStation = gasStattion
                request[0].nearby = nearby
                request[0].parkingAbility = parkingAbility
                   
               try context.save()
               print("Resaved!")
               
               } else {
                   save(identifier: identifier, amount: amount, description: description, electricity: electricity, water: water, gasStattion: gasStattion, nearby: nearby, parkingAbility: parkingAbility)
               }
           } catch {
               print(error.localizedDescription)
           }
       }
       
       // SAVE
       func save(identifier: String, amount: String, description: String, electricity: Bool, water: Bool, gasStattion: String, nearby: String, parkingAbility: String) {
           
           let context = appDelegate.persistentContainer.viewContext
           let entity = NSEntityDescription.entity(forEntityName: "Location", in: context)
           let locationDB = NSManagedObject(entity: entity!, insertInto: context) as! Location
           do {
              
                locationDB.identifier = identifier
                locationDB.amount = amount
                locationDB.portrait = description
                locationDB.electricity = electricity
                locationDB.water = water
                locationDB.gasStation = gasStattion
                locationDB.nearby = nearby
                locationDB.parkingAbility = parkingAbility
               

               try context.save()
               print("Saved!")
                           
           } catch {
               print(error.localizedDescription)
           }
       }
}
