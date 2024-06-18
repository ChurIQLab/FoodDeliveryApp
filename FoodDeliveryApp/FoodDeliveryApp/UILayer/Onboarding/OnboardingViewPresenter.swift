//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 18.06.2024.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {

    // MARK: - Properties

    weak var coordinator: OnboardingCoordinator!

    // MARK: - Initial

    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }

    func onboardingFinish() {
        coordinator.finish()
    }
}
