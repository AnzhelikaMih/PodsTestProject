//
//  AppRouter.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

typealias RouterCompletions = [UIViewController : CompletionBlock]

final class AppRouter: NSObject {
    
    // MARK: - Properties
    
    fileprivate weak var rootController: UINavigationController?
    
    fileprivate var completions: RouterCompletions
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }
    
    var toPresent: UIViewController? {
        return rootController
    }
}

// MARK: - Private methods
extension AppRouter: Routable {
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent else { return }
        rootController?.visibleViewController?.present(controller, animated: animated, completion: nil)
    }
}
