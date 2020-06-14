//
//  MainViewModel.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SignupViewModel {
    
    
    let nameText = PublishSubject<String>()
    let surnameText = PublishSubject<String>()
    
    func notEmpty() -> Observable<Bool> {
        return Observable.combineLatest(self.nameText.asObserver().startWith(""), self.surnameText.asObservable().startWith("")).map { name, surname in
            return name.count >= 1 && surname.count >= 1
        }.startWith(false)
    
    }
    
    
    
    
    
    
    
    
    
    // INSTANCE
    let mainBM = MainBaseManager()
    
    // SAVE
    func save(name: String, surname: String, image: UIImage) {
        mainBM.resave(identifier: UserIdentity.identifier, name: name, surname: surname, image: imageToData(image: image))
    }
    
    // IMAGE TO DATA
    func imageToData(image: UIImage) -> Data {
        return image.pngData() ?? Data()
    }
    
    // FETCH
    func fetch() -> [String: Any] {
        
        var returnDict = [String: Any]()
        
        
        for item in self.mainBM.fetch(identifier: UserIdentity.identifier) {
            returnDict["name"] = item.name
            returnDict["surname"] = item.surname
            returnDict["image"] = dataToImage(image: item.image ?? Data())
    
        }
        return returnDict
    }
    
    // DATA TO IMAGE
    func dataToImage(image: Data) -> UIImage {
        return UIImage(data: image) ?? UIImage()
    }
}
