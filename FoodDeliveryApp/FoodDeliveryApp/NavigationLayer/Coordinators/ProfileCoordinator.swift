//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 09.06.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {

    override func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .blue
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func finish() {
        print("ProfileCoordinator Finish")
    }
}
