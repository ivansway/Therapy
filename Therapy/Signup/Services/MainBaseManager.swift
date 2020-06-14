//
//  MainBaseManager.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MainBaseManager {
    
    // APP DELEGATE
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // RESAVE
    func resave(identifier: String, name: String, surname: String, image: Data) {
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Main> = Main.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "identifier == %@", identifier)
        
        do {
            let request = try context.fetch(fetchRequest) as [Main]
            if request.count > 0 {
                
                request[0].image = image
                request[0].name = name
                request[0].surname = surname
                
            try context.save()
            print("Resaved!")
            
            } else {
                save(identifier: identifier, name: name, surname: surname, image: image)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // SAVE PASSWORD
    func save(identifier: String, name: String, surname: String, image: Data) {
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Main", in: context)
        let mainDB = NSManagedObject(entity: entity!, insertInto: context) as! Main
        do {
           
            mainDB.identifier = identifier
            mainDB.image = image
            mainDB.name = name
            mainDB.surname = surname

            try context.save()
            print("Saved!")
                        
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // FETCH PASSWORD
    func fetch(identifier: String) -> [Main] {

        var mainDB: [Main] = []
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Main> = Main.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "identifier == %@", identifier)

        do {
            let request = try context.fetch(fetchRequest) as [Main]
            
            mainDB = request

        } catch {
            print(error.localizedDescription)
        }
        return mainDB
    }
}
