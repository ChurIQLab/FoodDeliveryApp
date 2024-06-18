//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 09.06.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {

    override func start() {
        showOnboarding()
    }

    override func finish() {
        print("OnboardingCoordinator Finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()

        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .purple

        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .yellow

        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .red

        pages.append(firstViewController)
        pages.append(secondViewController)
        pages.append(thirdViewController)

        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
