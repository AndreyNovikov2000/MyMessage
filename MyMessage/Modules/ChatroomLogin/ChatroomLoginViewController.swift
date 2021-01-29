//
//  ChatroomLoginViewController.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit

class ChatroomLoginViewController: UIViewController {

    // MARK: - IBOiutlets
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Object livecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Private methods

extension ChatroomLoginViewController {
    private func setupUI() {
        let bundle = Bundle(for: ChatroomLoginViewController.self)
        avatarImageView.image = UIImage(named: "avatarImage", in: bundle, with: nil)
        
    }
}
