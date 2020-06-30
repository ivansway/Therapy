//
//  MainViewModel.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignupViewModel {
    
    init() {
        // FETCH USER DATA
        self.fetch()
    }
    
    // INSTANCE
    let signupBM = SignupBaseManager()
    let bag: DisposeBag? = DisposeBag()
    
    let nameText: PublishSubject? = PublishSubject<String>()
    let surnameText: PublishSubject? = PublishSubject<String>()
    
    // LAUNCH DATA
    var launchData: [String: Any]? = [String: Any]()
    
    
    func notEmpty() -> Observable<Bool> {
        
        return Observable.combineLatest(self.nameText!.asObserver().startWith(""), self.surnameText!.asObservable().startWith("")).map { name, surname in
            
            
            return name.count >= 1 && surname.count >= 1
            
        }.startWith(false)
        
    }
    
    // SAVE
    func save(name: String, surname: String, image: UIImage) {
        signupBM.resave(identifier: UserIdentity.identifier, name: name, surname: surname, image: imageToData(image: image))
    }
    
    // IMAGE TO DATA
    func imageToData(image: UIImage) -> Data {
        return image.pngData() ?? Data()
    }
    
    // DATA TO IMAGE
    func dataToImage(image: Data) -> UIImage {
        return UIImage(data: image) ?? UIImage()
    }
    
    func fetch() {
        
        // FETCH
        self.signupBM.fetch()
                        
        Observable.from(self.signupBM.signupDB).subscribe({ data in
            if let element = data.element {
                self.launchData?["name"] = element.name
                self.launchData?["surname"] = element.surname
                self.launchData?["image"] = self.dataToImage(image: element.image ?? Data())
                }
            })
        .disposed(by: bag!)
    }
}
