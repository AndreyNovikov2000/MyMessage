//
//  Presenter.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 1/29/21.
//

import Foundation
import Utils
import RxSwift
import RxCocoa


class Presenter: Presentation {
    typealias UseCases = (login: (_ email: String, _ username: String) -> Single<()>,
                          ())
    var input: Input
    var output: Output
    
    private let router: Routing
    private let useCases: UseCases
    private let disposeBag = DisposeBag()
     
    init(input: Input, router: Routing, useCases: UseCases) {
        self.input = input
        self.output = Presenter.output(input: input)
        self.router = router
        self.useCases = useCases
        
        process()
    }
}


private extension Presenter {
    static func output(input: Input) -> Output {
        let emailObservable = input.email.asObservable()
        let usernameObservable = input.userName.asObservable()
        
        let enableLoginDriver = Observable.combineLatest(emailObservable, usernameObservable).map { (email, username) in
            guard !email.isEmpty && !username.isEmpty else { return false }
            guard email.count > 5 && username.count > 3 else { return false }
            guard email.isEmail() else { return false }
            
            return true
        }.asDriver(onErrorJustReturn: false)
        
        return (enableLoginDriver, ())
    }
    
    func process() {
        let unputTextFieldObservable = Driver.combineLatest(input.userName, input.email)
        
        input.loginTapped
            .withLatestFrom(unputTextFieldObservable)
            .asObservable()
            .flatMap({ [useCases] (username, email) in
                useCases.login(username, email)
            }).subscribe()
            .disposed(by: disposeBag)
    }
}
