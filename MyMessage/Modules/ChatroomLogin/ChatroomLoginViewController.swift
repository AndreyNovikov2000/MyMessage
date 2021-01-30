//
//  ChatroomLoginViewController.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import RxSwift
import RxCocoa


protocol Presentation {
    typealias Input = (userName: Driver<String>,
                       email: Driver<String>,
                       loginTapped: Driver<Void>)
    
    typealias Output = (enableLoginButton: Driver<Bool>, ())
    typealias Producer = (Presentation.Input) -> Presentation
    
    var input: Input { get set }
    var output: Output { get set }
}


class ChatroomLoginViewController: UIViewController {
    
    // MARK: - IBOiutlets
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Viper Module
    
    private var presenter: Presentation!
    var presenterProduces: Presentation.Producer!
    
    // MARK: - Private  properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Object livecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPresenter()
        setupUI()
        bundingUI()
    }
}

// MARK: - Private methods

private extension ChatroomLoginViewController {
    func setupUI() {
        let bundle = Bundle(for: ChatroomLoginViewController.self)
        avatarImageView.image = UIImage(named: "avatar-icon", in: bundle, with: nil)
        loginButton.setImage(UIImage(named: "log-in", in: bundle, with: nil), for: .normal)
    }
    
    func setupPresenter() {
        let input: Presentation.Input = (userName: userNameTextField.rx.text.orEmpty.asDriver(),
                                         email: emailTextField.rx.text.orEmpty.asDriver(),
                                         loginTapped: loginButton.rx.tap.asDriver())
        presenter = presenterProduces(input)
    }
    
    func bundingUI() {
        presenter.output.enableLoginButton.drive(loginButton.rx.isEnabled).disposed(by: disposeBag)
    }
}
