//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 09.06.2024.
//

import UIKit

class AppCoordinator: Coordinator {

    override func start() {
        showOnboardingFlow()
    }

    override func finish() {
        print("AppCoordinator Finish")
    }
}

// MARK: - Navigation methods

private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding,
                                                         navigationController: navigationController)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }

    func showMainFLow() {

    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)

        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
