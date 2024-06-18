//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Churkin Vitaly on 18.06.2024.
//

import UIKit

// MARK: - Onboarding view controller

class OnboardingViewController: UIViewController {

    // MARK: - Properties

    private var pages = [UIViewController]()

    // MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    weak var viewOutput: OnboardingViewOutput!

    // MARK: - Initial

    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageControl()
    }
}

// MARK: - Layout

private extension OnboardingViewController {
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }

    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0

        pageControl.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

// MARK: - Datasource

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }

        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }

        return pages[currentIndex + 1]
    }
}

// MARK: - Delegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
        }
    }
}
