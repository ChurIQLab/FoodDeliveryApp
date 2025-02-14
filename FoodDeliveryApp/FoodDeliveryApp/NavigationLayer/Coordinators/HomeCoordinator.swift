//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 09.06.2024.
//

import UIKit

class HomeCoordinator: Coordinator {

    override func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .red
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func finish() {
        print("HomeCoordinator Finish")
    }
}
