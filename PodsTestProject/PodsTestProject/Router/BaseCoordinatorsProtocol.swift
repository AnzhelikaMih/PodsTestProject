//
//  BaseCoordinator.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

typealias CompletionBlock = () -> Void

protocol Route { }

enum BaseRoutes {
    case alert(UIAlertController?), pop, dismiss
    case toast(String)
}

protocol Coordinatable: AnyObject {
    func start()
}

protocol Presentable {
    var toPresent: UIViewController? { get }
}

protocol Routable: Presentable {
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
}

extension Routable {
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
}
 
extension UIViewController: Presentable {
    var toPresent: UIViewController? {
        return self
    }
    
    func showAlert(title: String,
                   message: String? = nil,
                   alertStyle: UIAlertController.Style = .alert) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: alertStyle)
        
        self.present(alert, animated: true, completion: nil)
    }
}

