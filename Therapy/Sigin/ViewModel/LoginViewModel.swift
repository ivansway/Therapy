//
//  LoginViewModel.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    let usernameText = PublishSubject<String>()
    let passwordText = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameText.asObservable().startWith(""), passwordText.asObservable().startWith("")).map { username, login in
            return username.count > 3 && login.count > 3
        }.startWith(false)
    }
}
