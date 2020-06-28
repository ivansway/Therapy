//
//  LocationViewModel.swift
//  Therapy
//
//  Created by Ivan Myrza on 19/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LocationViewModel {
    
    // INSTANCE
    let locationBM = LocationBaseManager()
    let bag = DisposeBag()
    
    let parking = PublishSubject<String>()
    let nearby = PublishSubject<String>()
    let description = PublishSubject<String>()
    let electricity = PublishSubject<Bool>()
    let water = PublishSubject<Bool>()
    let gasStation = PublishSubject<String>()
    let parkingAbility = PublishSubject<String>()
    let amount = PublishSubject<String>()
    
    // IS VALID
    func isValid() -> Observable<Bool> {
        
        return Observable.combineLatest(parking.asObserver().startWith(""), nearby.asObserver().startWith(""), description.asObserver().startWith("")).map {
            
            parking, nearby, description in
        
            return parking.count >= 2 && nearby.count >= 2 && description.count > 30
        
        }.startWith(false)
    }
    
    // SAVE
    func save() {
        
//        isValid().bind(onNext: { self.parking.asObserver().startWith(""), nearby.asObserver().startWith(""), description.asObserver().startWith(""), electricity.asObserver().startWith(false), water.asObserver().startWith(false), gasStation.asObserver().startWith(""), parkingAbility.asObserver().startWith(""), amount.asObserver().startWith("") }).map {
//
//        }
        
        
        
        Observable.combineLatest(parking.asObserver().startWith(""), nearby.asObserver().startWith(""), description.asObserver().startWith(""), electricity.asObserver().startWith(false), water.asObserver().startWith(false), gasStation.asObserver().startWith(""), parkingAbility.asObserver().startWith(""), amount.asObserver().startWith("")).map { parking, nearby, description, electricity, water, gasStation, parkingAbility, amount in
            
            
            
            
            
            
            
            
            self.locationBM.resave(identifier: UserIdentity.identifier, amount: amount, description: description, electricity: electricity, water: water, gasStattion: gasStation, nearby: nearby, parkingAbility: parkingAbility)
            }
        .bind(onNext: { print("")} ).disposed(by: bag)
    }
}
