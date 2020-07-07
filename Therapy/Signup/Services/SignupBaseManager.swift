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


class SignupBaseManager {
    
    // SIGN UP DB
    internal var signupDB: [Main] = []
    internal var participant: [ParticipantDB] = []
    
    // APP DELEGATE
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    init() {
        
        // FETCH PARTICIPANT
        fetchParticipant()
        
        // FETCH
        fetch()
    }
    
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
    
    // SAVE
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
    
    // FETCH
    func fetch() {

        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Main> = Main.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "identifier == %@", UserIdentity.identifier)

        do {
            let request = try context.fetch(fetchRequest) as [Main]


            self.signupDB = request

        } catch {
            print(error.localizedDescription)
        }
    }
    
    // SAVE PARTICIPANT
    public func resaveParticipant(name: String, surname: String, image: Data, birthday: String, identifier: String) {
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ParticipantDB> = ParticipantDB.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "identifier == %@", identifier)
        
        do {
            let request = try context.fetch(fetchRequest) as [ParticipantDB]
            if request.count > 0 {
                
                request[0].image = image
                request[0].name = name
                request[0].surname = surname
                request[0].birthday = birthday
                
                
                
            try context.save()
            print("Resaved!")
            
            } else {
                saveParticipant(identifier: identifier, name: name, surname: surname, image: image, birthday: birthday)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // SAVE PARTICIPANT
    func saveParticipant(identifier: String, name: String, surname: String, image: Data, birthday: String) {
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ParticipantDB", in: context)
        let participantDB = NSManagedObject(entity: entity!, insertInto: context) as! ParticipantDB
        do {
           
            participantDB.identifier = identifier
            participantDB.image = image
            participantDB.name = name
            participantDB.surname = surname
            participantDB.birthday = birthday
            
            try context.save()
            print("Saved!")
                        
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // FETCH
    func fetchParticipant() {
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ParticipantDB> = ParticipantDB.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "identifier == %@", UserIdentity.identifier)
        
        do {
            let request = try context.fetch(fetchRequest) as [ParticipantDB]
            
            participant = request
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
