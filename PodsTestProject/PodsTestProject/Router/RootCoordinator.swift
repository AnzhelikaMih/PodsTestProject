//
//  RootCoordinator.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

final class RootCoordinator: BaseCoordinator {
    
    private var router: Routable
    
    init(router: Routable) {
        self.router = router
        super.init()
    }
}

// MARK: - Coordinatable
extension RootCoordinator: Coordinatable {
    func start() {
        makePreviewFlowCoordinator().start()
    }
}

extension RootCoordinator {
    func makePreviewFlowCoordinator() -> PreviewFlowCoordinator {
        let coordinator = PreviewFlowCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard let self = self else { return }
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        return coordinator
    }
}
