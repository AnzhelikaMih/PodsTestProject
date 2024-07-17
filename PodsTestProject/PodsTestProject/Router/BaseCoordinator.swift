//
//  BaseCoordinator.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import Foundation

class BaseCoordinator {
    
    var childCoordinators: [Coordinatable] = []
        
    func addDependency(_ coordinator: Coordinatable) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

