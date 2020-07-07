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
    
    // DELETE BUTTON ARRAY
    internal var deleteButtonArray: [UIButton] = []
    
    // PARTICIPANT's NAME
    internal var birthdayTFArray: [UITextField] = []
    internal var nameTF: [UITextField] = []
    internal var surnameTF: [UITextField] = []
    
    // PARTICIPANT
    internal var participant: [Participant] = []
    internal var tag = 0
    
    // PARTICIPANT BACK ARRAY
    internal var participantBack: [UIView] = []
    
    // PARTICIPANT IMAGE
    public var participantImage: [Data] = []
    
    // PARTICIPANT
    var member = [[String: Any]]()

    
    // INSTANCE
    let signupBM: SignupBaseManager? = SignupBaseManager()
    let bag = DisposeBag()
    
    let nameText: PublishSubject? = PublishSubject<String>()
    let surnameText: PublishSubject? = PublishSubject<String>()
    
    // LAUNCH DATA
    var launchData: [String: Any]? = [String: Any]()
    
    init() {
        // FETCH USER DATA
        self.fetch()
    
        // FETCH PARTICIPANT
        fetchParticipant()
    }
    
    
    public func notEmpty() -> Observable<Bool> {
        
        return Observable.combineLatest(self.nameText!.asObserver().startWith(""), self.surnameText!.asObservable().startWith("")).map { name, surname in
            
            
            return name.count >= 1 && surname.count >= 1
            
        }.startWith(false)
        
    }
    
    // SAVE
    public func save(name: String, surname: String, image: UIImage) {
        signupBM!.resave(identifier: UserIdentity.identifier, name: name, surname: surname, image: imageToData(image: image))
    }
    
    // IMAGE TO DATA
    public func imageToData(image: UIImage) -> Data {
        return image.pngData() ?? Data()
    }
    
    // DATA TO IMAGE
    private func dataToImage(image: Data) -> UIImage {
        return UIImage(data: image) ?? UIImage()
    }
    
    private func fetch() {
                        
        Observable.from(self.signupBM!.signupDB).subscribe({ data in
            if let element = data.element {
                self.launchData?["name"] = element.name
                self.launchData?["surname"] = element.surname
                self.launchData?["image"] = self.dataToImage(image: element.image ?? Data())
                }
            })
        .disposed(by: bag)
    }
    
    // CONSTRUCT ARRAY
    internal func constructArray() {
       
        nameTF.append(UITextField())
        surnameTF.append(UITextField())
        deleteButtonArray.append(UIButton())
        participantBack.append(UIView())
        birthdayTFArray.append(UITextField())
        self.tag = nameTF.count - 1
        
        // SAVE PARTICIPANT
        saveParticipant()
    }
    
    // SAVE PARTICIPANT
    private func saveParticipant() {
        
        Observable.combineLatest(nameTF[tag].rx.text.asObservable(), surnameTF[tag].rx.text.asObservable()).map {
            name, surname in
            
            guard let name = name else {return}
            guard let surname = surname else {return}
            
            var imageData: Data? = Data()
            for item in Participant.signupVM!.participantImage {
                imageData = item
            }
            
            if name.count >= 2 && surname.count >= 2 {
               
                self.signupBM!.resaveParticipant(name: name,
                                                surname: surname,
                                                image: imageData!,
                                                birthday: self.birthdayTFArray[self.tag].text ?? "",
                                                identifier: UserIdentity.identifier)
            }
            
            }.subscribe().disposed(by: bag)
    }
    
    // FETCH PARTICIPANT
    public func fetchParticipant() {
        
        var dictionary = [String: Any]()
        
        Observable
            .from(signupBM!.participant)
            .subscribe(onNext: { participant in
            
            for _ in self.signupBM!.participant {
                
                dictionary["name"] = participant.name
                dictionary["surname"] = participant.surname
                dictionary["image"] = self.dataToImage(image: participant.image ?? Data())
                dictionary["birthday"] = participant.birthday
                dictionary["identifier"] = participant.identifier
            }
            
            self.member.append(dictionary)
            
            }).disposed(by: bag)
    }
}

