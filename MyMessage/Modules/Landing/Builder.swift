//
//  Builder.swift
//  Landing
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Utils

public final class Builder {
    public static func build(complition: @escaping () -> Void) -> UIViewController {
        let storyboard = UIStoryboard(name: "Landing", bundle: Bundle(for: self))
        let landingViewController = LandingViewController.instantiate(from: storyboard)
        landingViewController.onStart = complition
        return landingViewController
    }
}
