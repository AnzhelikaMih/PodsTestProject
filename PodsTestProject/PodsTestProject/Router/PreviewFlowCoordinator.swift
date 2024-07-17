//
//  PreviewFlowCoordinator.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

enum PreviewFlowRoute: Route {
    case main
    case base(BaseRoutes)
}

protocol PreviewFlowCoordinatorOutput: AnyObject {
    var finishFlow: CompletionBlock? { get set }
    func trigger(_ route: PreviewFlowRoute)
}

final class PreviewFlowCoordinator: BaseCoordinator, PreviewFlowCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let router : Routable
    fileprivate let rootController: UIViewController?
    
    init(router: Routable) {
        self.router = router
        self.rootController = router.toPresent
    }
    
    func trigger(_ route: PreviewFlowRoute) {
        switch route {
        case .main:
            let podService = PodsManager()
            let vc = PreviewViewModel(podsService: podService, router: self)
            let previewFlowVC = PodsViewController(viewModel: vc )
            router.setRootModule(previewFlowVC)
        case .base(let base):
            switch base {
            case .alert(let alert):
                router.present(alert)
                break
            default: break
            }
        }
    }
}

// MARK: - Coordinatable
extension PreviewFlowCoordinator: Coordinatable {
    func start() {
        trigger(.main)
    }
}

