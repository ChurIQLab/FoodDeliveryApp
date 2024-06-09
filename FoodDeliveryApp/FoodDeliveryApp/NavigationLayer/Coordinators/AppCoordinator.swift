//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 09.06.2024.
//

import UIKit

class AppCoordinator: Coordinator {

    override func start() {
        //showOnboardingFlow()
        showMainFLow()
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
        guard let navigationController = navigationController else { return }

        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "house.fill"), tag: 0
        )
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()

        let orderNavigationController = UINavigationController()
        let orderCoordinator = HomeCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(
            title: "Order", image: UIImage(systemName: "house.fill"), tag: 1
        )
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()

        let listNavigationController = UINavigationController()
        let listCoordinator = HomeCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(
            title: "List", image: UIImage(systemName: "house.fill"), tag: 2
        )
        listCoordinator.finishDelegate = self
        listCoordinator.start()

        let profileNavigationController = UINavigationController()
        let profileCoordinator = HomeCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile", image: UIImage(systemName: "house.fill"), tag: 3
        )
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()

        [homeCoordinator, orderCoordinator, listCoordinator, profileCoordinator]
            .forEach { addChildCoordinator($0) }

        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)

        navigationController.pushViewController(tabBarController, animated: true)
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
