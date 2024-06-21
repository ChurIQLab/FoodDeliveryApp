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
        var pages = [OnboardingPartViewController]()

        let chickenLegViewController = OnboardingPartViewController()
        chickenLegViewController.imageToShow = UIImage(resource: .chickenLeg1)
        chickenLegViewController.titleText = "Delicious Food"
        chickenLegViewController.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        chickenLegViewController.buttonText = "Next"

        let shippedViewController = OnboardingPartViewController()
        shippedViewController.imageToShow = UIImage(resource: .shipped1)
        shippedViewController.titleText = "Fast Shipping"
        shippedViewController.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        shippedViewController.buttonText = "Next"

        let medalViewController = OnboardingPartViewController()
        medalViewController.imageToShow = UIImage(resource: .medal1)
        medalViewController.titleText = "Certificate Food"
        medalViewController.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        medalViewController.buttonText = "Next"

        let creditCardViewController = OnboardingPartViewController()
        creditCardViewController.imageToShow = UIImage(resource: .creditCard1)
        creditCardViewController.titleText = "Payment Online"
        creditCardViewController.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        creditCardViewController.buttonText = "Cool!"
        
        pages.append(chickenLegViewController)
        pages.append(shippedViewController)
        pages.append(medalViewController)
        pages.append(creditCardViewController)

        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
