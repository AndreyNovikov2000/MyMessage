//
//  Builder.swift
//  Landing
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Utils

public final class Builder {
    public static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Landing", bundle: Bundle(for: self))
        let landingViewController = LandingViewController.instantiate(from: storyboard)
        return landingViewController
    }
}
