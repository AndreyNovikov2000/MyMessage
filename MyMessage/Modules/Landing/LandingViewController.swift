//
//  LandingViewController.swift
//  Landing
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit

class LandingViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Instance prroperties
    
    var onStart: (() -> Void)?
    
    // MARK: - Object livecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - IBAction
    
    @IBAction func onStartButtonTapped(_ sender: UIButton) {
        onStart?()
    }
}


// MARK: - Setup UI

extension LandingViewController {
    private func setupUI() {
        let bundle = Bundle(for: LandingViewController.self)
        logoImageView.image = UIImage(named: "logoImage", in: bundle, with: nil)
    }
}

