//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 09.06.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {

    override func start() {
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func finish() {
        print("OnboardingCoordinator Finish")
    }
}


